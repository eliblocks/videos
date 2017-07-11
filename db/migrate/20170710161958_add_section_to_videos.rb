class AddSectionToVideos < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :section, foreign_key: true
  end
end
