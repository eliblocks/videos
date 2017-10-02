require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Videos
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.eager_load_paths << "#{Rails.root}/lib"

    # USD/seconds currency conversion 1 USD gets 6000 seconds of viewing time.
    config.rate = 3000
    config.commission = 0.30

    if Rails.env == 'development' || Rails.env == 'test'
      config.gateway_token = '6pnm3uesJujkZtx1qkZBPd73F5D'
    else
      config.gateway_token = '6pnm3uesJujkZtx1qkZBPd73F5D'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
