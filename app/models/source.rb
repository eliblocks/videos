class Source < ApplicationRecord
  # belongs_to :customer
  # has_many :charges

  def self.create_from_stripe(charge, user)
    unless source_exists?(charge, user)
      create!(
        stripe_source_id: charge.source.id,
        customer_id: Customer.find_by_stripe(charge.customer)
      )
    end
  end


  def self.source_exists?(charge, user)
    sources = user.sources
    if sources
      return sources.map(&:stripe_source_id).include?(charge.source.id)
    end
    false
  end

  def self.find_by_stripe(stripe_source_id)
    find_by(stripe_source_id: stripe_source_id).id
  end
end
