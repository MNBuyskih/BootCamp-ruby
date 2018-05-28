require 'rspec'
require_relative 'multiples_3_5'

describe '#multiples_3_5' do
  it 'returns sum of all multiples of 3 or 5' do
    expect(multiples_3_5(10)).to eq(23)
    expect(multiples_3_5(20)).to eq(78)
    expect(multiples_3_5(200)).to eq(9168)
  end
end
