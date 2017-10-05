def partition(str)
  return [[]] if str.empty?
  (0...str.length).each_with_object([]) do |idx, arr|
    sub_str = str[0..idx]
    next unless is_palindrome?(sub_str)
    partition(str[idx + 1..-1]).each { |sub| arr << [sub_str, *sub] }
  end
end

def is_palindrome?(str)
  str == str.reverse
end

p partition("racecar")
