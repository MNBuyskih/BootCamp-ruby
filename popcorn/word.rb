class Word
  attr_reader :letters

  def initialize(letters)
    @letters = letters
  end

  def to_s
    @letters.map(&:to_s).join
  end
end