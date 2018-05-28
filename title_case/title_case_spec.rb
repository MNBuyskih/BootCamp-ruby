require 'rspec'
require_relative 'title_case'

describe '#title_case' do
  it 'returns capitalize words' do
    expect(title_case('a clash of KINGS')).to eq('A Clash Of Kings')
    expect(title_case('a clash of KINGS', 'a an the of')).to eq('A Clash of Kings')
    expect(title_case('THE WIND IN THE WILLOWS', 'The In')).to eq('The Wind in the Willows')
    expect(title_case('the quick brown fox')).to eq('The Quick Brown Fox')
  end
end
