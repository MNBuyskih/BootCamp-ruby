require_relative '../word'

describe 'Word' do
  it 'should return a string' do
    word = Word.new(%w[a b c])
    expect(word.to_s).to eq('abc')
  end
end