class AddPublishedAtToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :published_at, :datetime
  end
end
