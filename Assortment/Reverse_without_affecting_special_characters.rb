def special_reverse(str)
  return str if str.length < 2

  alphabets = ("a".."z").to_a + ("A".."Z").to_a
  left_idx, right_idx = 0, str.length - 1

  while left_idx < right_idx
    if !alphabets.include?(str[left_idx])
      left_idx += 1
    elsif !alphabets.include?(str[right_idx])
      right_idx -= 1
    else
      str[left_idx], str[right_idx] = str[right_idx], str[left_idx]
      left_idx += 1
      right_idx -= 1
    end
  end

  str
end

p special_reverse("Ra@ce$ca*r!")
