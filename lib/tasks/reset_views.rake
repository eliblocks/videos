desc "Reset video minutes viewed"
task reset_views: [:environment] do
  Video.all.each do |vid|
    vid.update(seconds_viewed: vid.seconds_played)
  end
end
