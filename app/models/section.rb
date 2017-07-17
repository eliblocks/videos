class Section < ApplicationRecord
  belongs_to :course, optional: true
  has_many :videos

  attribute :position, :integer

  def add_position
    if id  == nil
      self.position = course.sections.count + 1
      return self
    else
      self.position = course.sections.ids.find_index(id) + 1
      return self
    end
  end

  def self.add_positions
    all.each_with_index { |section, index| section.position = index + 1 }
  end

  def length_in_seconds
    videos.sum(:length_in_seconds)
  end


end
