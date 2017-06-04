require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    customer: Field::HasOne,
    charges: Field::HasMany,
    sources: Field::HasMany,
    videos: Field::HasMany,
    plays: Field::HasMany,
    id: Field::Number,
    facebook_id: Field::String,
    full_name: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    age_range: Field::String,
    link: Field::String,
    gender: Field::String,
    locale: Field::String,
    image: Field::String,
    timezone: Field::String,
    updated_time: Field::String,
    verified: Field::Boolean,
    email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    balance: Field::Number,
    admin: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :customer,
    :charges,
    :sources,
    :videos,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :customer,
    :charges,
    :sources,
    :videos,
    :plays,
    :id,
    :facebook_id,
    :full_name,
    :first_name,
    :last_name,
    :age_range,
    :link,
    :gender,
    :locale,
    :image,
    :timezone,
    :updated_time,
    :verified,
    :email,
    :created_at,
    :updated_at,
    :balance,
    :admin,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :customer,
    :charges,
    :sources,
    :videos,
    :plays,
    :facebook_id,
    :full_name,
    :first_name,
    :last_name,
    :age_range,
    :link,
    :gender,
    :locale,
    :image,
    :timezone,
    :updated_time,
    :verified,
    :email,
    :balance,
    :admin,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
