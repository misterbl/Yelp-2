class Review < ActiveRecord::Base
  validates :text, presence: true
  validates_inclusion of :rating, :in => 1..5
end
