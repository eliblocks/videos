require 'dropbox_api'
require_relative 'wistia.rb'

client = DropboxApi::Client.new(ENV['DROPBOX_AUTH_TOKEN'])

courses = client.list_folder('').entries
course_files = []

courses.each do |course|
  sections = client.list_folder(course.path_lower).entries
  sections.each do |section|
    if section.class == DropboxApi::Metadata::Folder
      files = client.list_folder(section.path_lower).entries
      files.each do |file|
        course_files << file.path_lower
      end
    end
  end
end

existing_links = client.list_shared_links.links

existing_link_paths = existing_links.map { |link| link.path_lower }

new_links = []

course_files.each do |file|
  unless existing_link_paths.include?(file)
    new_links << client.create_shared_link_with_settings(file)
  end
end

links = existing_links + new_links


manager = Manager.new
existing_wistia_video_names = manager.project.medias.map(&:name)

puts "All Links:"
puts links

links_to_import = links.select { |link|
  !existing_wistia_video_names.include?(link.path_lower) && link.path_lower[-3,3] == "mp4"
}

puts
puts "New Videos:"
puts links_to_import

links_to_import.each do |link|
  p manager.import_video(link.url, link.path_lower)
end














