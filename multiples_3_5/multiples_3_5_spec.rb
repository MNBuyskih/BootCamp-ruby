require 'rspec'
require_relative 'multiples_3_5'

describe 'multiples of 3 and 5' do
  it '#multiples_3_5' do
    expect(multiples_3_5(10)).to eq(23)
    expect(multiples_3_5(20)).to eq(78)
    expect(multiples_3_5(200)).to eq(9168)
  end
end
