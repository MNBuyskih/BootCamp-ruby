require_relative 'word'

class Letter
  attr_reader :connections, :letter

  def initialize(letter)
    @letter = letter
    @connections = []
  end

  def to_s
    @letter
  end

  def connect(letter)
    @connections << letter
  end

  def tails(exclude = [])
    letters = @connections
                  .reject {|l| exclude.include? l}
    .map {|l| l.tails()}
    Word.new(letters)
  end
end
