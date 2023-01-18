# Preview all emails at http://localhost:3000/rails/mailers/order_reciept
class RecieptPreview < ActionMailer::Preview
  def send_order_reciept
  
    @user = User.last
    RecieptMailer.send_order_reciept(@user)
  end
end
