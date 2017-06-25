module ApplicationHelper
  def youtube_time(seconds)
    hours = 0
    minutes = 0
    while seconds >= 3600
      hours += 1
      seconds -= 3600
    end
    while seconds >= 60
      minutes += 1
      seconds -= 60
    end
    str = ( hours > 0 ? "#{hours}:#{minutes.to_s.rjust(2,'0')}:" : "#{minutes}:" ) + seconds.to_s.rjust(2,'0')
    return str
  end

  def wistia_uploader
    if Rails.env == 'production'
      project_id ='9hyra9x33g'
    else
      project_id = 'ma2vo0l9bd'
    end
    tag.div(id: 'wistia_uploader', style: 'height:360px;width:100%', data: { project: project_id })
  end

  def full_title(page_title = '')
    base_title = "Browzable"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end


end
