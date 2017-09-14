require 'dropbox_api'
require 'httparty'
require 'uri'
require 'wistia'


PROJECT_ID = '9hyra9x33g'

class Dropbox
  def initialize(course_path)
    @client = DropboxApi::Client.new(ENV['DROPBOX_AUTH_TOKEN'])
    @course_path = "/#{course_path}"
  end

  def sections
    entries = @client.list_folder(@course_path).entries
    entries.select { |section|
      section.class == DropboxApi::Metadata::Folder
    }
  end

  def files
    files = []
    sections.each do |section|
      files << @client.list_folder(section.path_lower).entries
    end
    files.flatten!
  end
end

class Matcher
  attr_accessor :wistia_files

  def initialize(course_path)
    Wistia.password = ENV['WISTIA_SECRET_KEY']
    @project = Wistia::Project.find(PROJECT_ID)
    @dropbox_files =  Dropbox.new(course_path).files
    @wistia_files = @project.medias
  end

  def matches
    matches = {}
    @dropbox_files.each do |dropbox|
      @wistia_files.each do |wistia|
        if wistia.name == dropbox.path_lower
          matches[wistia.id] = dropbox.path_lower
        end
      end
    end
    matches
  end
end





