class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :stripe_customer_id
      t.references :user, foreign_key: true
      t.integer :account_balance
      t.integer :created
      t.string :currency
      t.string :default_source
      t.string :delinquent
      t.string :description
      t.string :email
      t.string :card_id

      t.timestamps
    end
  end
end
