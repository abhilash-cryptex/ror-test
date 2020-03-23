class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :air_timing
      t.string :air_day
      t.integer :channel_id

      t.timestamps null: false
    end
  end
end
