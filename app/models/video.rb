class Video < ApplicationRecord
  belongs_to :user
  has_many :plays
  validates :vimeo_id, uniqueness: true
end
