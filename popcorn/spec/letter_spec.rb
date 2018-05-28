require_relative '../letter'

describe "Letter" do
  it 'should return tails' do
    letter = Letter.new('a')
    letter.connect(Letter.new('b'))
    letter.connect(Letter.new('c'))
    words = letter.tails()

    expect(words[0]).to be_a Word
    expect(words[0].to_s).to eq('ab')
    expect(words[1].to_s).to eq('ac')
  end
end