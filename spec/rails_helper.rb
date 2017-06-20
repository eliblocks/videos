# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] = 'test'
require 'spec_helper'
require 'capybara/rspec'

require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }



OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  uid: '101087770504462',
  info: {
    first_name: 'Dick',
    last_name: 'Fallersky',
    email: 'zgqrnhoyqm_1497307277@tfbnw.net',
    name: 'Dick Alahjigagcbdf Fallersky',
    image: 'http://graph.facebook.com/v2.9/101087770504462/picture?width=480&height=480',
    verified: false
  },
  credentials: {
    expires: true,
    expires_at: 1502562151,
    token: "EAAJG0ZAnQkCUBAECY4rZBfJ3ZBJtAfoRZCeo01wKYn9XJAZC3GZBeQHIopjDBGAInOooiGcEs9sQwG4hvbpYe5X60gib5IdLPGQntPLrCottc3qUJRZALvlNdL4cgODqz39cZB33lM8uC3lLopafRFHSOFrdZBQ3xyVN7OKYLNy5AtQZDZD"
  },
  extra: {
    raw_info: {
      id: '101087770504462',
      name: 'Joe Bloggs',
      first_name: 'Dick',
      last_name: 'Fallersky',
      link: 'https://www.facebook.com/app_scoped_user_id/101087770504462/',
      location: { id: '123456789', name: 'Palo Alto, California' },
      gender: 'male',
      email: 'zgqrnhoyqm_1497307277@tfbnw.net',
      timezone: 0,
      locale: 'en_US',
      verified: false,
      updated_time: '2017-06-13T18:22:15+0000',
      age_range: { max: 20, min: 18 }
    }
  }
})



  # etc.

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.


RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false
  config.include Features, type: :feature

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
