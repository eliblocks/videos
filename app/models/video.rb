class Video < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user
  belongs_to :section, optional: true
  has_many :plays
  acts_as_list scope: :section


  validates :wistia_id, presence: true, uniqueness: true
  validates :wistia_delivery_id, presence: true, uniqueness: true
  validates :title, presence: true, length: { maximum: 25, minimum: 3 }
  validates :description, length: { maximum: 255 }

  scope :approved, -> { where(approved: true) }


  algoliasearch if: :approved?, per_environment: true do
    attribute :title,
              :description,
              :user_id,
              :seconds_viewed,
              :length_in_seconds,
              :wistia_id,
              :wistia_delivery_id,
              :created_at

    searchableAttributes ['title']
    customRanking ['desc(seconds_viewed)']
    hitsPerPage 30
  end





  def thumbnail_url
    folder = "https://embed-ssl.wistia.com/deliveries/"
    "#{folder}#{wistia_delivery_id}.jpg?image_crop_resized=300x169&image_quality=100&ssl=true"
  end

  def add_seconds_viewed!(seconds)
    update!(seconds_viewed: seconds_viewed + seconds)
  end


  def approve
    update(approved: true)
  end

  def unapprove
    update(approved: false)
  end

  def seconds_played
    plays.sum(:length_in_seconds) || 0
  end

  def minutes_viewed
    seconds_viewed/60
  end

  def previous
    ""
  end

  def next
    ""
  end



end
