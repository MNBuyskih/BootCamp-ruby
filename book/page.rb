class Page
  attr_reader :text, :number
  MAX_PAGE_SIZE = 800

  def initialize(text, number)
    @text = text
    @number = number
  end

  def to_s
    "#{@text}\r\n\r\n#{@number}"
  end

  def bookmark
    @bookmarked = true
  end

  def bookmark?
    @bookmarked
  end
end