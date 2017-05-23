class ChangeBalanceDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :balance, from: nil, to: 0
  end
end
