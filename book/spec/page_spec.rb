require 'rspec'
require_relative '../page'

describe 'Page' do
  page = nil

  before do
    page = Page.new('text', 123)
  end

  it 'should return a page number in the bottom' do
    expect("#{page}").to eq("text\r\n\r\n123")
  end

  it 'should can be bookmarked' do
    page.bookmark
    expect(page.bookmark?).to be_truthy
  end
end