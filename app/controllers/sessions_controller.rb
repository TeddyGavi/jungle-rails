class SessionsController < ApplicationController
  def new
  end

  def create
    # render json: params
    @user = User.find_by(e_mail: params[:e_mail])
    if @user && @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to :root
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

end
