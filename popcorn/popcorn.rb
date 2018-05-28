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

  def is_word?(word)
    @vocabulary.include? word
  end

  def build(word, words = [])
    word_ = word.join
    words << word_ if is_word? word_
    word.last.connections
        .reject { |l| word.include? l }
        .each { |l| build([*word, l], words) }
    words
  end
end
