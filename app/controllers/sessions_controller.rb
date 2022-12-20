class SessionsController < ApplicationController
  def new
  end

  def create
    # render json: params
    @user = User.where("email = params[:e_mail]")
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to :new
  end
end
