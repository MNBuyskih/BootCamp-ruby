# require 'file'
require_relative 'book'

class Reader
  attr_accessor :book

  def create_from_file(file, title, author)
    create(File.read(file), title, author)
    true
  rescue
    false
  end

  def create(text, title, author)
    @book = Book.new(text, title, author)
  end
end