class Charge < ApplicationRecord
  belongs_to :user

  def self.create_from_transaction(transaction, user)
    seconds = Rails.configuration.rate * (transaction.amount / 100)

    create!(
    seconds: seconds,
    provider_charge_id: transaction.token,
    amount: transaction.amount,
    created: transaction.created_at,
    currency: transaction.currency_code,
    user_id: user.id
   )
  end

  def dollars
    amount * 100
  end
end
