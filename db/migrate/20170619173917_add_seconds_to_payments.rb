class AddSecondsToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :seconds, :integer
  end
end
