require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  palindrome_hash = HashMap.new(string.length)

  string.each_char do |ch|
    palindrome_hash[ch] = 0
  end

  string.each_char do |ch|
    palindrome_hash[ch] += 1
  end

  odd_char_counter = 0

  palindrome_hash.each do |_, val|
    odd_char_counter += 1 if val.odd?
  end

  odd_char_counter <= 1
end
