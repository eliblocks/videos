class Course < ApplicationRecord
  belongs_to :user
  has_many :sections, { dependent: :destroy }, -> { order(position: :asc) }
  accepts_nested_attributes_for :sections
  has_many :videos, through: :sections

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, length: { maximum: 255 }

  scope :approved, -> { where(approved: true) }

  def minutes
    seconds/60
  end

  def seconds
    secs = videos.pluck(:length_in_seconds).reduce(:+)
    secs = 0 if secs.nil?
    secs
  end

  def minutes_viewed
    seconds_viewed/60
  end

  def add_seconds_viewed(seconds)
    update(seconds_viewed: seconds_viewed + seconds)
  end

  def seconds_played
    videos.map { |video| video.plays.sum(:length_in_seconds) }.reduce(:+) || 0
  end
end




