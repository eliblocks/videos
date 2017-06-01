class RenameStripeSourceIdToProviderSourceId < ActiveRecord::Migration[5.1]
  def change
    rename_column :sources, :stripe_source_id, :provider_source_id
  end
end
