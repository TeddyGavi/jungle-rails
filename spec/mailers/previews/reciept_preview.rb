# Preview all emails at http://localhost:3000/rails/mailers/order_reciept
class RecieptPreview < ActionMailer::Preview
  def send_order_reciept
    # @user = params[:user]
    # @order = Order.last
    # raise @order.inspect
    # raise @user.inspect
    RecieptMailer.send_order_reciept
  end
end
