class Charge < ApplicationRecord
  belongs_to :user

  def self.create_from_transaction(transaction, user)
    seconds = Rails.configuration.rate * transaction.amount.to_i

    create!(
    seconds: seconds,
    gateway_charge_id: transaction.id,
    amount: transaction.amount.to_i,
    user_id: user.id
   )
  end

  def dollars
    amount * 100
  end
end
