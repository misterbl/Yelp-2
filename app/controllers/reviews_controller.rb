class ReviewsController < ApplicationController
  def create
    current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    @review.update(user_id: @current_user.id, reviewer: @current_user.email)
    @restaurant.update_average_ratings(@restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @current_user = User.find(current_user.id)
    @review = Review.find(params[:id])
    # @review.update(user_id: current_user.id, reviewer: current_user.email)

  end

  def update
    current_user
    @review = Review.find(params[:id])
    if @review.update(review_params)
      restaurant = Restaurant.find(@review.restaurant_id)
      restaurant.update_average_ratings(restaurant)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to user_path
  end


  private
    def review_params
      params.require(:review).permit(:text, :rating, :reviewer, :user_id, :restaurant_id)
    end

end
