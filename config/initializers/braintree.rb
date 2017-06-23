if Rails.env == 'development' || Rails.env == 'test'
  Braintree::Configuration.environment = :sandbox
elsif Rails.env == 'production'
  Braintree::Configuration.environment = :production
end

Braintree::Configuration.merchant_id = ENV["BRAINTREE_ID"]
Braintree::Configuration.public_key = ENV["BRAINTREE_PUBLIC_KEY"]
Braintree::Configuration.private_key = ENV["BRAINTREE_SECRET"]
