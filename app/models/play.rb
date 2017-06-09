class Play < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :length_in_seconds, length: { maximum: 60 }



end
