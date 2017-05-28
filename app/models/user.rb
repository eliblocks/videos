class User < ApplicationRecord
  has_one :customer
  has_many :charges
  has_many :sources, through: :customer
  has_many :videos
  has_many :plays

  def process(auth)
    if auth.extra.raw_info.nil?
      process_guest(auth)
    else
      self.email ||= auth.info.email
      self.full_name = auth.info.name
      self.image = auth.info.image
      self.verified = auth.info.verified
      self.facebook_id ||= auth.extra.raw_info.id
      self.first_name = auth.extra.raw_info.first_name
      self.last_name = auth.extra.raw_info.last_name
      self.link = auth.extra.raw_info.link
      self.gender = auth.extra.raw_info.gender
      self.timezone = auth.extra.raw_info.timezone
      self.updated_time = auth.extra.raw_info.updated_time
      self.locale = auth.extra.raw_info.locale
      self.age_range = auth.extra.raw_info.age_range.min.join
    end
  end

  def subtract_balance!(seconds)
    update!(balance: balance - seconds)
  end

  def add_balance!(seconds)
    update!(balance: balance + (seconds * (1 - Rrails.configuration.commission)))
  end
end
