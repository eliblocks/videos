class Section < ApplicationRecord
  belongs_to :course, optional: true
  has_many :videos, -> { order(position: :asc) }
  acts_as_list scope: :course


  def length_in_seconds
    videos.sum(:length_in_seconds)
  end


end
