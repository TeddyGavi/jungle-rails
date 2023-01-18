class RecieptMailer < ApplicationMailer
  def send_order_reciept(user)
    # raise user.inspect
    puts "sending order reciept to #{user.e_mail}"

    # raise params.inspect
    # @user = User.find(1)


    @order = Order.last
    # @user ||= User.find(session[:user_id]) if session[:user_id]

    # raise @order.inspect
    mail({
      # user: @user,
      # order: params[:order],
      to: "#{user.e_mail}",
      subject: "Order Reciept for Jungle Order ##{@order.id}",
      # body:"",
      # template_path: 'reciept_mailer',
      # template_name: 'mailer',
    })
    
  end
end
