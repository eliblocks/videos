#get list of ids and video names

require 'wistia'

Wistia.password = ENV['WISTIA_SECRET_KEY']
course_name = "learn modern javascript"

project = Wistia::Project.find('9hyra9x33g')

# def create_video(vid)
#   wistia_section_name = vid.name[/\/\d\d [\w| ]+\//][1..-2]
#   section_position = wistia_section_name[0..1]

# end




files = project.medias.select { |file| file.name[/\A\/#{course_name}\//] }
File.open("wistia_lessons", "w") do |file|
  files.each do |vid|
    file.print("#{vid.hashed_id}...#{vid.name}\n")
  end
end



