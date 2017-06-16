require 'wistia'

desc "Delete orphaned Wistia files"
task clean_wistia: [:environment] do
  log = ActiveSupport::Logger.new('log/clean_wistia.log')

  if Rails.env == 'production'
    project_id = '9hyra9x33g'
  else
    project_id = 'ma2vo0l9bd'
  end

  project = Wistia::Project.find(project_id)

  def media_ids(project)
    project.medias.map(&:hashed_id)
  end

  log.info "Task started at #{Time.now}"

  wistia_video_ids = media_ids(project)
  browzable_video_ids = Video.pluck(:wistia_id)

  wistia_orphan_video_ids = wistia_video_ids - browzable_video_ids
  browzable_orphan_video_ids = browzable_video_ids - wistia_video_ids

  wistia_orphan_video_ids.each { |id| Wistia::Media.delete(id) }
  browzable_orphan_video_ids.each { |id| Video.find_by(wistia_id: id).destroy }

  new_wistia_video_ids = media_ids(Wistia::Project.find(project_id))
  new_browzable_video_ids = Video.pluck(:wistia_id)

  deleted_wistia_ids = wistia_video_ids - new_wistia_video_ids
  deleted_browzable_ids = browzable_video_ids - new_browzable_video_ids

  deleted_medias = project.medias.select do |media|
    deleted_wistia_ids.include?(media.hashed_id)
  end

  deleted_medias.each { |media| log.info "deleted Wistia video: #{media}" }
  deleted_browzable_ids.each { |id| log.info "Deleted Browzable video #{Video.find_by(wistia_id: id)}" }

  log.info "Task ended at #{Time.now}"
  log.close

end
