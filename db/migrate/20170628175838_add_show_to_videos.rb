class AddShowToVideos < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :show, foreign_key: true
  end
end
