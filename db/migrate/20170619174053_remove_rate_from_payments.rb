class RemoveRateFromPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column(:payments, :rate)
  end
end
