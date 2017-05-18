class Customer < ApplicationRecord
  belongs_to :user

  def self.create_from_stripe(customer, videos_user_id)
    create!(
      user_id: videos_user_id,
      stripe_customer_id: customer.id,
      default_source: customer.default_source,
      created: customer.created,
      account_balance: customer.account_balance
    )
  end
end
