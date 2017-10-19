def caesar_cipher(str, num)
  return str if num == 0

  (0...str.length).each do |idx|
    next if str[idx] == " "
    current_ord = str[idx].ord - "a".ord
    new_ord = (current_ord + num) % 26

    str[idx] = (new_ord + "a".ord).chr
  end

  str
end

p caesar_cipher("abcd wxyz", -1)
