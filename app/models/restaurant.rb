class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
