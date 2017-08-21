class AddSecondsViewedToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :seconds_viewed, :integer, default: 0
  end
end
