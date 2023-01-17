class SessionsController < ApplicationController
  def new
  end

  def create
    # trim white space, is the best way to do this? Do not want to strip the password
    # if @user && @user.authenticate(login_params[:password])

    email = params[:login][:e_mail] 
    user_auth = User.authenticate_with_credentials(email.downcase.strip, params[:login][:password])
    if user_auth != nil
      session[:user_id] = user_auth.id
      # User.find_by_e_mail(email.downcase.strip).id
      # @user.id
      cookies[:user_id] = user_auth.id

      redirect_to :root
    else
      flash[:Error] = "Invalid login"
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :user_id
    redirect_to :login
  end

end
