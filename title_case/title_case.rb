def title_case(string, except = '')
  except_list = except.downcase.split(' ')
  w = string
          .downcase
          .split
          .each_with_index
          .map {|w, i| i > 0 && except_list.include?(w) ? w : w.capitalize}
          .join(' ')
end