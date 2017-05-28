class Video < ApplicationRecord
  belongs_to :user
  has_many :plays

  def thumbnail_url
    folder = "https://embed-ssl.wistia.com/deliveries/"
    "#{folder}#{wistia_delivery_id}.jpg?image_crop_resized=300x169&image_quality=100&ssl=true&video_still_time=3"
  end

  def add_seconds_viewed!(seconds)
    update!(seconds_viewed: seconds_viewed + seconds)
  end
end
