class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  has_attached_file :avatars, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
    :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["aws_access_key_id"],
        aws_secret_access_key: ENV["aws_secret_access_key"]
    },
    fog_directory: "rails-demo-env"

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
