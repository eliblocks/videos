class AddSecondsToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :seconds, :integer
  end
end
