desc "Clear videos from debelopment db"
task clear_videos: [:environment] do
  Video.all.each { |vid| vid.destroy }
end
