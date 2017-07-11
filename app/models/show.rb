class Show < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :videos, through: :section
end
