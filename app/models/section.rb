class Section < ApplicationRecord
  belongs_to :course, optional: true
  has_many :videos, { dependent: :destroy }, -> { order(position: :asc) }
  accepts_nested_attributes_for :videos
  acts_as_list scope: :course
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }


  def length_in_seconds
    videos.sum(:length_in_seconds)
  end

  def minutes_viewed
    seconds_viewed/60
  end

  def add_seconds_viewed(seconds)
    update(seconds_viewed: seconds_viewed + seconds)
  end

  def minutes_viewed
    seconds_viewed/60
  end

  def seconds_played
    videos.map { |video| video.plays.sum(:length_in_seconds) }.reduce(:+) || 0
  end

  def only_child?
    course.sections.count == 1
  end
end
