class Charge < ApplicationRecord
  # belongs_to :source
  belongs_to :user

  def self.create_from_stripe(charge, user)
    create!(
    rate: Rails.configuration.rate,
    stripe_charge_id: charge.id,
    amount: charge.amount,
    amount_refunded: charge.amount_refunded,
    balance_transaction: charge.balance_transaction,
    captured: charge.captured,
    created: charge.created,
    currency: charge.currency,
    description: charge.description,
    source_id: Source.find_by_stripe(charge.source.id),
    user_id: user.id
   )
  end
end
