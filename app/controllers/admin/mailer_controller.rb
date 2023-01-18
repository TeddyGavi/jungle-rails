class Admin::MailerController < Admin::BaseController

  def preview_welcome()
    @user = User.last
    # render :file => Rails.root.join('app/views/reciept_mailer/send_order_reciept.html.erb'), reciept_mailer: 'mailer'
    
  end

end