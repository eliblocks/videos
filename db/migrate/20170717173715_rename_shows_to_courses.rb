class RenameShowsToCourses < ActiveRecord::Migration[5.1]
  def change
    rename_table :shows, :courses
  end
end
