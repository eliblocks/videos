class Customer < ApplicationRecord
  belongs_to :user
  has_many :charges
  has_many :sources

  def self.create_from_stripe(customer, user)
    create!(
      user_id: user.id,
      stripe_customer_id: customer.id,
      default_source: customer.default_source,
      created: customer.created,
      account_balance: customer.account_balance
    )
  end

  def self.find_by_stripe(stripe_customer_id)
    find_by(stripe_customer_id: stripe_customer_id).id
  end

end
