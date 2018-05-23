class Format
  def initialize(seconds)
    @seconds = seconds.to_i
  end

  def format
    return 'now' if @seconds.zero?

    list = [year, days, hours, minutes, seconds].reject { |d| d.to_s.empty? }
    return list[0] if list.length == 1

    last = list.pop
    list.join(', ') + " and #{last}"
  end

  private

  def year
    calc 365 * 24 * 60 * 60, 'year'
  end

  def days
    calc 24 * 60 * 60, 'day'
  end

  def hours
    calc 60 * 60, 'hour'
  end

  def minutes
    calc 60, 'minute'
  end

  def seconds
    plural(@seconds, 'second') if @seconds > 0
  end

  def calc(per_one, word, words = "#{word}s")
    return nil if @seconds < per_one

    period = @seconds / per_one
    @seconds = @seconds % per_one
    plural(period, word, words)
  end

  def plural(num, word, words = "#{word}s")
    w = num == 1 ? word : words
    "#{num} #{w}"
  end
end