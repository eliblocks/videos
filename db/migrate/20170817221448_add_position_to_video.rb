class AddPositionToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :position, :integer
  end
end
