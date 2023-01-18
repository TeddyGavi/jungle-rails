# Preview all emails at http://localhost:3000/rails/mailers/order_reciept
class RecieptPreview < ActionMailer::Preview
  def send_order_reciept(user, order)
    raise user.inspect
    RecieptMailer.send_order_reciept(user, order)
  end
end
