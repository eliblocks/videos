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
end
