def format_duration(seconds)
  now = get_now seconds
  years, seconds = get_years seconds
  days, seconds = get_days seconds
  hours, seconds = get_hours seconds
  minutes, seconds = get_minutes seconds
  seconds = get_seconds seconds

  list = [now, years, days, hours, minutes, seconds].select{|d| d.length > 0}

  return list[0] if list.length == 1

  last = list.pop()
  list.join(", ") + " and #{last}"
end

def get_now(seconds)
  return "now" if seconds == 0
  ""
end

def get_seconds(seconds)
  return "#{seconds} #{plural(seconds, 'second')}" if seconds > 0
  ""
end

def get_minutes(seconds)
  calc seconds, 60, 'minute'
end

def get_hours(seconds)
  calc seconds, 60 * 60, 'hour'
end

def get_days(seconds)
  calc seconds, 24 * 60 * 60, 'day'
end

def get_years(seconds)
  calc seconds, 365 * 24 * 60 * 60, 'year'
end

def calc(seconds, per_one, word, words = "#{word}s")
  if seconds >= per_one
    period = seconds / per_one
    seconds = seconds % per_one
    return ["#{period} #{plural(period, word, words)}", seconds]
  end
  ["", seconds]
end

def plural(num, word, words = "#{word}s")
  return word if num === 1
  words
end