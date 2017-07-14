class Show < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :videos, through: :sections


  def minutes
    videos.sum(:length_in_seconds)/60
  end
end
