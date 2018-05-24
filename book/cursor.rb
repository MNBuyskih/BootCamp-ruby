class Cursor
  def initialize
    @n = 0
  end

  def current
    @n
  end

  def next
    @n += 1
  end

  def prev
    return @n if @n.zero?
    @n -= 1
  end

  def reset(n = 0)
    @n = n
  end
end