class AddRateToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :rate, :integer
  end
end
