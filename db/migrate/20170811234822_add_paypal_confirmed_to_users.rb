class AddPaypalConfirmedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :paypal_confirmed, :boolean, default: false
  end
end
