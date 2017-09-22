class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :charges
  has_many :payments
  has_many :videos, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :plays

  validates :email, presence: true, uniqueness: true


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image
      user.skip_confirmation!
    end
end

#copied from docs. not sure what this does.
def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.uploaders
    joins(:videos).group('users.id').having('count(user_id) > 0')
  end


  def subtract_balance!(seconds)
    update!(balance: balance - seconds)
  end

  def add_balance!(seconds)
    update!(balance: balance + (seconds * (1 - Rails.configuration.commission)))
  end

  def credit_purchase!(amount)
    update!(balance: balance + (amount * Rails.configuration.rate))
  end

  def minutes
    balance/60
  end

  def dollars
    balance / Rails.configuration.rate
  end

  def uploader?
    if videos.count > 0
      return true
    end
    false
  end

  def last_purchase_date
    if charges.any?
      charges.order(created_at: :desc).first.created_at
    else
      created_at
    end
  end

  def last_days
    ((Time.now - last_purchase_date) / 86400).round
  end

  def minutes_used
    spent_since_last_purchase / 60
  end


  def seconds_purchased
    charges.sum(:seconds) || 0
  end

  def seconds_played
    plays.sum(:length_in_seconds) || 0
  end

  def seconds_paid
    payments.sum(:seconds) || 0
  end

  def spent_since_last_purchase
    plays.where(created_at > last_purchase_date).sum(:length_in_seconds)
  end

  def course_play_sums
    course_times = {}
    plays.includes(:video, :section).each do |play|
      course_id = play.video.section.course_id
      if course_times.keys.include?(course_id)
        course_times[course_id] += play.length_in_seconds
      else
        course_times[course_id] = play.length_in_seconds
      end
    end
    course_times
  end

  def video_play_sums
    videos_times = {}
    plays.each do |play|
      if videos_times.keys.include?(play.video_id)
        videos_times[play.video_id] += play.length_in_seconds
      else
        videos_times[play.video_id] = play.length_in_seconds
      end
    end
    videos_times
  end

  def most_watched_videos(n)
    if n > video_play_sums.length
      n = video_play_sums.length
    end
    minimum_time = video_play_sums.values.sort.reverse[n-1]
    top_watches = video_play_sums.select { |k, v| v >= minimum_time }
    top_watches.transform_keys { |k| Video.find(k) }
  end

  def uploader_play_sums
    uploader_times = {}
    plays.includes(:video).each do |play|
      if uploader_times.keys.include?(play.video.user_id)
        uploader_times[play.video.user_id] += play.length_in_seconds
      else
        uploader_times[play.video.user_id] = play.length_in_seconds
      end
    end
    uploader_times
  end

  def most_watched_uploaders(n)
    if n > uploader_play_sums.length
      n = uploader_play_sums.length
    end
    minimum_time = uploader_play_sums.values.sort.reverse[n-1]
    top_watches = uploader_play_sums.select { |k, v| v >= minimum_time }
    top_watches.transform_keys { |k| User.find(k) }
  end

  def total_minutes_earned
    videos.pluck(:seconds_viewed).reduce(:+)/60
  end




end
