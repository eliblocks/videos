class AddAttachmentDownloadToVideos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :videos do |t|
      t.attachment :download
    end
  end

  def self.down
    remove_attachment :videos, :download
  end
end
