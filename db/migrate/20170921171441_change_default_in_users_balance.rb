class ChangeDefaultInUsersBalance < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :balance, from: 0, to: 6000
  end
end
