require 'rspec'
require_relative '../reader'

describe 'Reader' do
  reader = Reader.new

  before do
    reader = Reader.new
  end

  it 'should read from file' do
    expect(reader.create_from_file(File.expand_path('lib/Adskij_ogonb.txt'), '', '')).to be_truthy
  end

  it 'should return false if no file' do
    expect(reader.create_from_file('wrong file name', '', '')).to be_falsey
  end

  it 'create should create new book with text' do
    expect(reader.create('text', '', '')).to be_a Book
  end
end