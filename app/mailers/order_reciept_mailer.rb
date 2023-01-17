class OrderRecieptMailer < ApplicationMailer
  def send_order_reciept(user, order)
    @user = user
    @order = order
    mail({
      to: @user.id,
      from: default,
      subject: 'Order Reciept',
    })
  end
end
