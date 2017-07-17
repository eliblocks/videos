class Course < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :videos, through: :sections


  def minutes
    videos.sum(:length_in_seconds)/60
  end
end
