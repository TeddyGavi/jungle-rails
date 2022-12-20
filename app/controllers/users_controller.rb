class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created user."
      session[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to :signup
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :first_name,
        :last__name,
        :email, 
        :password, 
        :password_confirmation
      )
    end
end
