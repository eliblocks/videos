class AddWistiaDeliveryIdToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :wistia_delivery_id, :string
  end
end
