require_relative '../popcorn'
require_relative '../letter'

describe Popcorn do
  let(:popcorn) do
    a = Letter.new('a')
    b = Letter.new('b')
    c = Letter.new('c')
    a.connections = [b]
    b.connections = [c, a]
    c.connections = [a]

    Popcorn.new([a, b, c], %w[abc ba])
  end

  it 'should return list of words' do
    expect(popcorn.words).to match_array(%w[abc ba])
  end
end
