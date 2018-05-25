require 'rspec'
require_relative 'readable_duration_format_2'

describe 'Format in func style' do
  describe 'plural' do
    it 'one' do
      result = format_duration(1)
      expect(result).to eq('1 second')
    end
    it 'few' do
      result = format_duration(2)
      expect(result).to eq('2 seconds')
    end
  end

  it 'now' do
    result = format_duration(0)
    expect(result).to eq('now')
  end

  it '1 second' do
    result = format_duration(1)
    expect(result).to eq('1 second')
  end

  it 'and' do
    result = format_duration(62)
    expect(result).to eq('1 minute and 2 seconds')
  end

  it 'minutes' do
    result = format_duration(120)
    expect(result).to eq('2 minutes')
  end

  it 'hours' do
    result = format_duration(3 * 60 * 60)
    expect(result).to eq('3 hours')
  end

  it 'days' do
    result = format_duration(24 * 60 * 60)
    expect(result).to eq('1 day')
  end

  it 'years' do
    result = format_duration(3 * 365 * 24 * 60 * 60)
    expect(result).to eq('3 years')
  end

  it 'all together' do
    seconds = (1 * 365 * 24 * 60 * 60) + # 1 year
        (10 * 24 * 60 * 60) + # 10 days
        (2 * 60 * 60) + # 2 hours
        (10 * 60) + # 10 minutes
        (5) # 5 sec
    result = format_duration(seconds)
    expect(result).to eq('1 year, 10 days, 2 hours, 10 minutes and 5 seconds')
  end
end