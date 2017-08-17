class Course < ApplicationRecord
  belongs_to :user
  has_many :sections, -> { order(position: :asc) }
  has_many :videos, through: :sections

  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, length: { maximum: 255 }


  def minutes
    videos.sum(:length_in_seconds)/60
  end
end




