class User < ApplicationRecord
  has_many :videos
  has_many :plays

  def process(auth)
    if auth.extra.raw_info.nil?
      process_guest(auth)
    else
      self.email ||= auth.info.email
      self.name = auth.info.name
      self.image = auth.info.image
      self.verified = auth.info.verified
      self.facebook_id ||= auth.extra.raw_info.id
      self.first_name = auth.extra.raw_info.first_name
      self.last_name = auth.extra.raw_info.last_name
      self.link = auth.extra.raw_info.link
      self.gender = auth.extra.raw_info.gender
      self.picture = auth.extra.raw_info.picture.data.url
      self.timezone = auth.extra.raw_info.timezone
      self.updated_time = auth.extra.raw_info.updated_time
      self.locale = auth.extra.raw_info.locale
      self.age_range = auth.extra.raw_info.age_range.min.join
      self.favorites_count = 0
      self.blocks_count = 0
    end
  end
end
