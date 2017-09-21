class AddDefaultToVideosSecondsViewed < ActiveRecord::Migration[5.1]
  def change
    hange_column_default :videos,  :seconds_viewed, 0
  end
end
