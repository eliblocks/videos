class Section < ApplicationRecord
  belongs_to :show
  has_many :videos
end
