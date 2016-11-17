class RestaurantsController < ApplicationController
  def index
    user_signed_in?
    current_user
    @restaurants = Restaurant.all
  end

  def new
    user_signed_in?
    current_user
    @restaurant = Restaurant.new
  end

  def edit
    user_signed_in?
    current_user
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    user_signed_in?
    current_user
    @user = User.find(@current_user.id)
    @restaurant = @user.restaurants.create(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    current_user
    @reviews = @restaurant.reviews
  end

  def update
    current_user
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end


  def destroy
    @restaurant = Restaurant.find(params[:id])
    if current_user.id == @restaurant.user_id
      @restaurant.destroy
    end

    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :user_id, {avatars: []}, :address)
  end
end
