class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :facebook_id
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :age_range
      t.string :link
      t.string :gender
      t.string :locale
      t.string :image
      t.string :timezone
      t.string :updated_time
      t.boolean :verified
      t.string :email

      t.timestamps
    end
  end
end
