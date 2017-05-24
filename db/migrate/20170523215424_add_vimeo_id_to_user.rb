class AddVimeoIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :vimeo_id, :string
  end
end
