class Format
  def initialize(seconds)
    @seconds = seconds.to_i
  end

  def format
    return 'now' if @seconds.zero?

    list = [years, days, hours, minutes, seconds].reject { |d| d.to_s.empty? }
    return list[0] if list.length == 1

    last = list.pop
    list.join(', ') + " and #{last}"
  end

  private

  def years
    compute! 365 * 24 * 60 * 60, 'year'
  end

  def days
    compute! 24 * 60 * 60, 'day'
  end

  def hours
    compute! 60 * 60, 'hour'
  end

  def minutes
    compute! 60, 'minute'
  end

  def seconds
    plural(@seconds, 'second') if @seconds > 0
  end

  def compute!(count, singular)
    return if @seconds < count

    period = @seconds / count
    @seconds = @seconds % count
    plural(period, singular)
  end

  def plural(count, singular)
    word = count == 1 ? singular : "#{singular}s"
    "#{count} #{word}"
  end
end