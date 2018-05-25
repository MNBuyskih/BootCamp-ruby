def solution(number)
  list = *(1...number).select { |n| (n % 3).zero? || (n % 5).zero? }
  list.inject(0, :+)
end