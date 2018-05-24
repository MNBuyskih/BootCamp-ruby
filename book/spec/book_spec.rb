require 'rspec'
require_relative '../book'

describe 'Book' do
  text = File.read('lib/Adskij_ogonb.txt')
  book = Book.new(text, 'title', 'author')

  before do
    book = Book.new(text, 'title', 'author')
  end

  it 'should have title' do
    expect(book.title).to eq('title')
  end

  it 'should have author' do
    expect(book.author).to eq('author')
  end

  it 'should return page count' do
    expect(book.pages_count).to be > 0
  end

  it 'should return specified page' do
    expect(book.page(0)).to be_a Page
    expect(book.page(0).number).to eq(0)
  end

  it 'should return current page' do
    expect(book.current_page).to be_a Page
    expect(book.current_page.number).to eq(0)
  end

  it 'should return next page' do
    expect(book.next_page).to be_a Page
    expect(book.current_page.number).to eq(1)
  end

  it 'should return prev page' do
    book.next_page
    book.next_page
    expect(book.prev_page).to be_a Page
    expect(book.current_page.number).to eq(1)
  end

  it 'should return first page' do
    expect(book.first_page.number).to eq(0)
  end

  it 'should return last page' do
    expect(book.last_page.number).to eq(4)
  end

  it 'should return true if is first page' do
    expect(book.first_page?).to be_truthy
  end

  it 'should return false if is not last page' do
    expect(book.last_page?).to be_falsey
  end

  it 'should return true if is last page' do
    book.last_page
    expect(book.last_page?).to be_truthy
  end

  it 'next should return last page if it is the last' do
    book.last_page
    expect(book.next_page.number).to eq(4)
  end

  it 'should skip pages' do
    expect(book.skip(2).number).to eq(2)
  end

  it 'should return last page if try to skip too many pages' do
    book.skip(1000)
    expect(book.last_page?).to be_truthy
  end

  it 'should return bookmarked pages' do
    expect(book.bookmarked.length).to eq(0)
    expect(book.page(0).bookmark).to be_truthy
    expect(book.page(1).bookmark).to be_truthy
    expect(book.bookmarked.length).to eq(2)
  end
end