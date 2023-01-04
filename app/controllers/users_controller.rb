class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render json: params
    @user = User.new(user_params)
    if @user.save
      flash[:Notice] = "Successfully created user."
      session[:user_id] = @user.id
      redirect_to :root
    else
      # redirect_to :signup
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :e_mail, 
        :password, 
        :password_confirmation
      )
    end
end
