class RenameStripeCustomerIdToProviderCustomerId < ActiveRecord::Migration[5.1]
  def change
    rename_column :customers, :stripe_customer_id, :provider_customer_id
  end
end
