require 'httparty'
require 'uri'
require 'wistia'

Wistia.password = ENV['WISTIA_SECRET_KEY']

# HTTParty.post('http://foo.com/resources', query: {bar: 'baz'})
class Manager
  attr_accessor :project
  def initialize
    @project = Wistia::Project.find('9hyra9x33g')
  end

  def import_video(url, name)
    HTTParty.post('https://upload.wistia.com', query: {
    api_password: Wistia.password,
    url: url,
    project_id: @project.id,
    name: name
    })
  end
end



