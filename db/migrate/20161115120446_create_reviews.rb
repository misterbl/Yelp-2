class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :rating
      t.string :reviewer
      t.references :restaurant, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
