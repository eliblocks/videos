class RemoveRateFromCharges < ActiveRecord::Migration[5.1]
  def change
    remove_column :charges, :rate
  end
end
