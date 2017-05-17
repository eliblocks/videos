class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :user, foreign_key: true
      t.string :wistia_id
      t.integer :seconds_viewed
      t.string :title
      t.integer :length_in_seconds
      t.integer :price_step, default: 0
      t.string :description

      t.timestamps
    end
  end
end
