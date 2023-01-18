class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
 
    # @cart_contains = LineItem.joins(:order, :product).where(order_id: params[:id])
    # @cart_products =  Product.where(id: @cart_contains.select(:product_id))
 
  end

  def create
    authorize
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  
      charge = perform_stripe_charge
      order  = create_order(charge)

      if order.valid?
        empty_cart!
        # add mailer for order reciept here
        mail = RecieptMailer.send_order_reciept(@current_user)
        # un comment the raise to see the mail message will actually be sent
        # need to configure actually settings in the dev environment to use the smtp source server of choice
        # raise mail.inspect 
        
        flash[:Notice] = 'Your Order has been placed.'
        redirect_to order 
      else
        redirect_to cart_path, flash: { error: order.errors.full_messages.first }
      end
  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Your Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)

    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
