class RestaurantsController < ApplicationController
  def index
    current_user
    @restaurants = Restaurant.all
  end

  def new
    current_user
    @restaurant = Restaurant.new
  end

  def edit
    current_user
    @restaurant = Restaurant.find(params[:id])
  end

  def create
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
     @restaurant.destroy

     redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :user_id, {avatars: []})
  end
end
