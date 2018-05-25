require_relative 'reader'

reader = Reader.new
result = reader.create_from_file(ARGV[0], ARGV[1], ARGV[2])

unless result
  puts 'something wrong with your file'
  exit
end

puts reader.book.page(ARGV[3].to_i).to_s