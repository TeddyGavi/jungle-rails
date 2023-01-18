class RecieptMailer < ApplicationMailer
  def send_order_reciept(user)
    @order = Order.last
    mail({
      to: "#{user.e_mail}",
      subject: "Order Reciept for Jungle Order ##{@order.id}",
    })
    
  end
end
