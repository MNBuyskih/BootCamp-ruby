require 'rspec'
require_relative '../cursor'

describe 'Cursor' do
  cursor = nil

  before do
    cursor = Cursor.new
  end

  it 'should return current position' do
    expect(cursor.current).to eq(0)
  end

  it 'should return next position' do
    expect(cursor.next).to eq(1)
  end

  it 'should return prev position' do
    cursor.next
    cursor.next
    expect(cursor.prev).to eq(1)
  end

  it 'prev should return 0 if current position is 0' do
    expect(cursor.prev).to eq(0)
  end

  it'should reset to zero' do
    cursor.next
    cursor.next
    cursor.next
    expect(cursor.reset).to eq(0)
    expect(cursor.current).to eq(0)
  end

  it'should reset to specified' do
    expect(cursor.reset(10)).to eq(10)
    expect(cursor.current).to eq(10)
  end
end