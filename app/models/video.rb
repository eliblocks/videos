class Video < ApplicationRecord
  belongs_to :user
  has_many :plays
end
