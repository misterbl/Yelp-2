class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
