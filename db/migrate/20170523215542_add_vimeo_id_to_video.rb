class AddVimeoIdToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :vimeo_id, :string
  end
end
