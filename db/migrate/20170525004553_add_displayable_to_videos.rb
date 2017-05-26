class AddDisplayableToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :displayable, :boolean, default: false
  end
end
