require "administrate/base_dashboard"

class VideoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    plays: Field::HasMany,
    id: Field::Number,
    wistia_id: Field::String,
    seconds_viewed: Field::Number,
    title: Field::String,
    length_in_seconds: Field::Number,
    price_step: Field::Number,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    wistia_delivery_id: Field::String,
    approved: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :title,
    :seconds_viewed,
    :length_in_seconds,
    :approved
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :plays,
    :id,
    :wistia_id,
    :seconds_viewed,
    :title,
    :length_in_seconds,
    :price_step,
    :description,
    :created_at,
    :updated_at,
    :wistia_delivery_id,
    :approved,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :plays,
    :wistia_id,
    :seconds_viewed,
    :title,
    :length_in_seconds,
    :price_step,
    :description,
    :wistia_delivery_id,
    :approved,
  ].freeze

  # Overwrite this method to customize how videos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(video)
  #   "Video ##{video.id}"
  # end
end
