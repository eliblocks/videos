class RenameColumnsToCourse < ActiveRecord::Migration[5.1]
  def change
    rename_column :sections, :show_id, :course_id
  end
end
