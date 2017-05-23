class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :stripe_source_id
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
