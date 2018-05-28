require 'rspec'
require_relative 'ip_validation'

describe '#ipv4?' do
  context 'for valid addresses' do
    it 'returns true' do
      expect(ipv4?('1.2.3.4')).to be_truthy
      expect(ipv4?('123.45.67.89')).to be_truthy
    end
  end

  context 'for invalid addresses' do
    it 'returns false' do
      expect(ipv4?('1.2.3')).to be_falsey
      expect(ipv4?('1.2.3.4.5')).to be_falsey
      expect(ipv4?('123.456.78.90')).to be_falsey
      expect(ipv4?('123.045.067.089')).to be_falsey
    end
  end
end
