class RenameStripeChargeIdToProviderChageId < ActiveRecord::Migration[5.1]
  def change
    rename_column :charges, :stripe_charge_id, :provider_charge_id
  end
end
