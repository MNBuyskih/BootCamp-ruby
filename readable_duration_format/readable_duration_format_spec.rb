require 'rspec'
require_relative 'readable_duration_format'

describe Format do
  describe 'plural' do
    it 'one' do
      formatter = Format.new(1)
      expect(formatter.format).to eq('1 second')
    end
    it 'few' do
      formatter = Format.new(2)
      expect(formatter.format).to eq('2 seconds')
    end
  end

  it 'now' do
    formatter = Format.new(0)
    expect(formatter.format).to eq('now')
  end

  it '1 second' do
    formatter = Format.new(1)
    expect(formatter.format).to eq('1 second')
  end

  it 'and' do
    formatter = Format.new(62)
    expect(formatter.format).to eq('1 minute and 2 seconds')
  end

  it 'minutes' do
    formatter = Format.new(120)
    expect(formatter.format).to eq('2 minutes')
  end

  it 'hours' do
    formatter = Format.new(3 * 60 * 60)
    expect(formatter.format).to eq('3 hours')
  end

  it 'days' do
    formatter = Format.new(24 * 60 * 60)
    expect(formatter.format).to eq('1 day')
  end

  it 'years' do
    formatter = Format.new(3 * 365 * 24 * 60 * 60)
    expect(formatter.format).to eq('3 years')
  end

  it 'all together' do
    seconds = (1 * 365 * 24 * 60 * 60) + # 1 year
        (10 * 24 * 60 * 60) + # 10 days
        (2 * 60 * 60) + # 2 hours
        (10 * 60) + # 10 minutes
        (5) # 5 sec
    formatter = Format.new(seconds)
    expect(formatter.format).to eq('1 year, 10 days, 2 hours, 10 minutes and 5 seconds')
  end
end