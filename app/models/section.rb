class Section < ApplicationRecord
  belongs_to :course, optional: true
  has_many :videos, { dependent: :destroy }, -> { order(position: :asc) }
  accepts_nested_attributes_for :videos
  acts_as_list scope: :course
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }


  def length_in_seconds
    videos.sum(:length_in_seconds)
  end
end
