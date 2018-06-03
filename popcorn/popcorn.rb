require_relative 'letter'

class Popcorn
  def initialize(letters, vocabulary)
    @letters = letters
    @vocabulary = vocabulary
  end

  def words
    @letters.map { |letter| build([letter]) }.flatten.uniq
  end

  private

  def valid_word?(word)
    @vocabulary.include? word
  end

  def build(letters, words = [])
    word = letters.join
    words << word if valid_word? word
    letters.last.connections
      .reject { |l| letters.include? l }
      .each { |l| build([*letters, l], words) }
    words
  end
end
