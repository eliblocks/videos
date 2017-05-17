class AddBalanceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :balance, :integer, deafult: 0
  end
end
