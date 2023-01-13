class SessionsController < ApplicationController
  def new
  end

  def create
    # trim white space, is the best way to do this? Do not want to strip the password
    email = login_params[:e_mail] 
    @user = User.find_by_e_mail(email.downcase.strip) 
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash[:Error] = "Invalid login"
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end
private

def login_params
  params.require(:login).permit(:e_mail, :password)
end 
end
