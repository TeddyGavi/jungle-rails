class SessionsController < ApplicationController
  def new
  end

  def create
    # raise params.inspect
    @user = User.find_by_e_mail(params[:login][:e_mail])
    # puts user.authenticate params[:login][:password]
    # raise user.inspect
    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash[:error] = "Invalid login"
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

end
