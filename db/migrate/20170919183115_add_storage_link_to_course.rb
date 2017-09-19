class AddStorageLinkToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :storage_link, :string
  end
end
