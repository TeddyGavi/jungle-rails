class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    subtotal = enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
    if Sale.active.any?
      percent_off = Sale.active.first.percent_off
      order_discount = subtotal * percent_off / 100
      subtotal - order_discount
    else
      subtotal
    end
  end
  helper_method :cart_subtotal_cents

  def subtotal_without_modifications
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :subtotal_without_modifications

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Add a authorize to any controller that you want to secure. This will force user's to login  
  def authorize
    unless current_user
      flash[:Notice] = "Plase login or register"
      redirect_to '/login' 
    end
  end
end
