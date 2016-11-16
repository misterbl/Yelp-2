class AddAvatarsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :avatars, :json
  end
end
