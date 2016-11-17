class AddAverageRatingToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :average_rating, :float, :default => 0
  end
end
