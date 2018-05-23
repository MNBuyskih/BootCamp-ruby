require 'rspec'
require_relative 'ip_validation'

describe 'IP v4 validation' do
  describe 'valid addresses' do
    it 'should be true' do
      expect(ip_validation('1.2.3.4')).to be_truthy
      expect(ip_validation('123.45.67.89')).to be_truthy
    end
  end

  describe 'invalid addresses' do
    it 'should be false' do
      expect(ip_validation('1.2.3')).to be_falsey
      expect(ip_validation('1.2.3.4.5')).to be_falsey
      expect(ip_validation('123.456.78.90')).to be_falsey
      expect(ip_validation('123.045.067.089')).to be_falsey
    end
  end
end