require_relative 'format'

formatter = Format.new ARGV[0]
puts formatter.format