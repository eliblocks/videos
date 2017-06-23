Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = ENV["BRAINTREE_ID"]
Braintree::Configuration.public_key = "bzp6xbxjt6w4fycx"
Braintree::Configuration.private_key = ENV["BRAINTREE_SECRET"]
