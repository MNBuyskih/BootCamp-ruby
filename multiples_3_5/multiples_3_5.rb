def multiples_3_5(number)
  (1...number).select { |n| n % 3 == 0 || n % 5 == 0 }.inject(:+)
end
