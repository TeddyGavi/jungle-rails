# Preview all emails at http://localhost:3000/rails/mailers/order_reciept
class RecieptPreview < ActionMailer::Preview
  def send_order_reciept
  # this is needed here because we don't have access to session data, this user is actually passed to the send_order_reciept method at the time of ordering  
    @user = User.last
    RecieptMailer.send_order_reciept(@user)
  end
end
