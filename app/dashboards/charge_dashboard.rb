require "administrate/base_dashboard"

class ChargeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    source: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    provider_charge_id: Field::String,
    amount: Field::Number,
    amount_refunded: Field::Number,
    balance_transaction: Field::String,
    captured: Field::Boolean,
    created: Field::Number,
    currency: Field::String,
    description: Field::String,
    success: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    rate: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :source,
    :user,
    :id,
    :provider_charge_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :source,
    :user,
    :id,
    :provider_charge_id,
    :amount,
    :amount_refunded,
    :balance_transaction,
    :captured,
    :created,
    :currency,
    :description,
    :success,
    :created_at,
    :updated_at,
    :rate,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :source,
    :user,
    :provider_charge_id,
    :amount,
    :amount_refunded,
    :balance_transaction,
    :captured,
    :created,
    :currency,
    :description,
    :success,
    :rate,
  ].freeze

  # Overwrite this method to customize how charges are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(charge)
  #   "Charge ##{charge.id}"
  # end
end
