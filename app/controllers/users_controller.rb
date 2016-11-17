class UsersController < ApplicationController

  def show
    current_user = User.find(params[:id])
    current_user
  end
end
