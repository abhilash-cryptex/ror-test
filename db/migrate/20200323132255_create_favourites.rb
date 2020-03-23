class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :show_id
      t.boolean :favourite

      t.timestamps null: false
    end
  end
end
