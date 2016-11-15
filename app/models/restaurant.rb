class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def calculate_average_ratings(restaurant)
      all_reviews = restaurant.reviews
          avg_rating =  all_reviews.inject(0) { |sum, num| sum + num.rating } /
                          all_reviews.length
      { average_rating: avg_rating }
  end

  def update_average_ratings(restaurant)
    average = calculate_average_ratings(restaurant)
    restaurant.update(average)
  end

end
