class AddAverageRatingToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :average_rating, :float
  end
end
