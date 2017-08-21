class Course < ApplicationRecord
  belongs_to :user
  has_many :sections, { dependent: :destroy }, -> { order(position: :asc) }
  accepts_nested_attributes_for :sections
  has_many :videos, through: :sections

  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, length: { maximum: 255 }


  def minutes
    seconds/60
  end

  def seconds
    videos.sum(:length_in_seconds)
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




