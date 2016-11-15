class ReviewsController < ApplicationController
  def create
    current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    @review.update(user_id: @current_user.id, reviewer: @current_user.email)
    redirect_to restaurant_path(@restaurant)
  end


  private
    def review_params
      params.require(:review).permit(:text, :rating, :reviewer, :user_id, :restaurant_id)
    end

end
