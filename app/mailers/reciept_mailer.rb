class RecieptMailer < ApplicationMailer
  def send_order_reciept(user, order)
    @user = user 
    @order = order
    mail({
      to: "test@example.com",
      from: 'no-reply@jungle.com',
      subject: 'Order Reciept',
      # body:"",
      # template_path: 'reciept_mailer',
      # template_name: 'mailer',
    })
    
  end
end
