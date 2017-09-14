#get list of ids and video names

require 'wistia'

Wistia.password = ENV['WISTIA_SECRET_KEY']

project = Wistia::Project.find('9hyra9x33g')
course_name = "react - chris"
files = project.medias.select { |file| file.name[/\A\/#{course_name}\//] }
File.open("wistia_lessons", "w") do |file|
  files.each do |vid|
    file.print("#{vid.hashed_id}...#{vid.name}\n")
  end
end
