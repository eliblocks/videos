class AddDefaultToLengthInSeconds < ActiveRecord::Migration[5.1]
  def change
    change_column_default :plays, :length_in_seconds, from: nil, to: 0r
  end
end
