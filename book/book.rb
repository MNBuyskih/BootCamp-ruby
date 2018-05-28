require_relative 'page'
require_relative 'cursor'

class Book
  attr_reader :title, :author

  def initialize(text, title, author)
    @text = text
    @title = title
    @author = author
    @cursor = Cursor.new
    split_to_pages
  end

  def pages_count
    @pages.length
  end

  def page(number)
    @pages[@cursor.reset(number)]
  end

  def current_page
    @pages[@cursor.current]
  end

  def next_page
    return last_page if last_page?
    @pages[@cursor.next]
  end

  def prev_page
    @pages[@cursor.prev]
  end

  def first_page
    @pages[@cursor.reset]
  end

  def last_page
    @pages[@cursor.reset(max_page_number)]
  end

  def skip(n)
    page([@cursor.current + n, max_page_number].min)
  end

  def first_page?
    @cursor.current.zero?
  end

  def last_page?
    @cursor.current == max_page_number
  end

  def bookmarked
    @pages.select {|p| p.bookmark?}
  end

  private

  def max_page_number
    @pages.length - 1
  end

  def split_to_pages
    @pages = []
    page = []
    pageLength = 0

    text = @text.gsub("\r\n", "\n")

    text.split(/(\s)/).each do |word|
      if (pageLength + word.length) > Page::MAX_PAGE_SIZE
        add_page(page.join.strip)
        page = []
        pageLength = 0
      end

      page << word
      pageLength += word.length
    end

    add_page(page.join.strip)
  end

  def add_page(text)
    @pages << Page.new(text, @pages.length)
  end
end