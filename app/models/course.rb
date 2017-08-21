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
end




