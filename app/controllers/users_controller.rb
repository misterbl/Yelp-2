class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully logged in!"
      redirect_to @user
    else render 'new'
    end
  end

  def show
    current_user
  end
private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
