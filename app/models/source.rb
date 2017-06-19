class Source < ApplicationRecord
  #belongs_to :customer
  has_many :charges
  belongs_to :user

  def self.create_from_transaction(transaction, user)
    unless source_exists?(transaction, user)
      create!(
        provider_source_id: transaction.payment_method.token, user_id: user.id
      )
    end
  end


  def self.source_exists?(transaction, user)
    sources = user.sources
    if sources
      return sources.map(&:provider_source_id).include?(transaction.payment_method.token)
    end
    false
  end

  def self.find_by_provider(provider_source_id)
    find_by(provider_source_id: provider_source_id).id
  end
end
