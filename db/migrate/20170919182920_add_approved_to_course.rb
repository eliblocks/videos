class AddApprovedToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :approved, :boolean, default: false
  end
end
