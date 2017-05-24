class AddVimeoTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :vimeo_token, :string
  end
end
