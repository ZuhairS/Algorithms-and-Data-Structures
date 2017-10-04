require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash_count = HashMap.new(0)

  string.each_char do |char|
    hash_count[char] += 1
  end

  num_odds = 0

  hash_count.each do |_, count|
    num_odds += 1 if count % 2 == 1

    if is_even_length?(string)
      return false if num_odds > 0
    else
      return false if num_odds > 1
    end
  end

  true
end

def is_even_length?(string)
  string.length % 2 == 0
end
