class AddLengthInSecondsToPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :plays, :length_in_seconds, :integer
  end
end
