def title_case(string, except = '')
  except_list = except.downcase.split
  string
    .capitalize
    .split
    .map { |w| except_list.include?(w) ? w : w.capitalize }
    .join(' ')
end
