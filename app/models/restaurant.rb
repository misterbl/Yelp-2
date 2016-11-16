class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  mount_uploaders :avatars, AvatarUploader
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

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

  # def geoAddresse
  #   geocoded_by :address
  #   after_validation :geocode
  #
  # end
  #
  # def geoIp
  #   geocoded_by :ip_address,
  #   :latitude => :lat, :longitude => :lon
  #   after_validation :geocode
  #
  # end

end
