require_relative '../popcorn'
require_relative '../letter'

describe 'Popcorn' do
  popcorn = nil

  before do
    L = Letter
    a = L.new('a')
    b = L.new('b')
    c = L.new('c')
    a.connections = [b]
    b.connections = [c, a]
    c.connections = [a]

    popcorn = Popcorn.new([a, b, c], %w[abc ba])
  end

  it 'should return list of words' do
    expect(popcorn.words).to match_array(%w[abc ba])
  end
end
