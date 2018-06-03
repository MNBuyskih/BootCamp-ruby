class Letter
  attr_accessor :connections
  attr_reader :letter

  def initialize(letter)
    @letter = letter
    @connections = []
  end

  def to_s
    @letter
  end
end
