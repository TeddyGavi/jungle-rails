# Preview all emails at http://localhost:3000/rails/mailers/order_reciept
class RecieptPreview < ActionMailer::Preview
  def send_order_reciept
  # this is needed here because we don't have access to session data, this user is actually passed to the send_order_reciept method at the time of ordering  
    @user = User.last 
    @order = Order.last
    if @user && @order
      RecieptMailer.send_order_reciept(@user, @order)
    else
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        e_mail: 'test@example.com',
        password: 'test',
        password_confirmation: 'test',
      )

      @order = Order.new({
        total_cents: 2999,
        stripe_charge_id: "34320-898*()",
        email: "test@example.com",
      })

      RecieptMailer.send_order_reciept(@user, @order)
    end
  end
end
