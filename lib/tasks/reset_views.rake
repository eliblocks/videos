desc "Reset video minutes viewed"
task reset_views: [:environment] do
  Video.all.each do |video|
    video.update(seconds_viewed: video.seconds_played)
  end

  Section.all.each do |section|
    section.update(seconds_viewed: section.seconds_played)
  end

  Course.all.each do |course|
    course.update(seconds_viewed: course.seconds_played)
  end
end
