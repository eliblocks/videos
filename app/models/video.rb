class Video < ApplicationRecord
  belongs_to :user
  has_many :plays
  validates :vimeo_id, uniqueness: true

  scope :displayable, -> { where(displayable: true) }



  def self.update_vimeo_videos(user, token, vimeo_id)
    videos = []
    address = "https://api.vimeo.com/users/#{vimeo_id}/videos"
    response = HTTParty.get(address, headers: { "Authorization" => "Bearer #{token}" })
    data = JSON.parse(response.body)["data"]
    data.each do |data|
      video = Video.new(title: data["name"],
        user_id: user.id,
        length_in_seconds: data["duration"],
        vimeo_id: link_id(data),
        description: data['description'],
        thumbnail_url: data['pictures']['sizes'][2]['link'])
      videos << video
    end
    save_videos(videos)
  end

  def self.link_id(element)
    element["uri"].gsub("/videos/", "")
  end

  def self.save_videos(videos)
    videos.each do |video|
      if existing_video = Video.find_by(vimeo_id: video.vimeo_id)
        existing_video.update!(title: video.title,
                              description: video.description,
                              length_in_seconds: video.length_in_seconds,
                              thumbnail_url: video.thumbnail_url)
      else
        video.save!
      end
    end
  end
end
