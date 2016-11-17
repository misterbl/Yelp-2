class UsersController < ApplicationController

  def show
    current_user = User.find(params[:id])
    current_user
  end
end

def update
  current_user
  @current_user = User.find(params[:id])
  if @current_user.update(user_params)
    redirect_to user_path
  else
    render 'edit'
  end
end
