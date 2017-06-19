class AddUserIdToSource < ActiveRecord::Migration[5.1]
  def change
    add_reference :sources, :user, foreign_key: true
  end
end
