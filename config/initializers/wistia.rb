require 'wistia'

Rails.configuration.wistia = {
  password: ENV['WISTIA_SECRET_KEY']

}
Wistia.password = Rails.configuration.wistia[:password]
