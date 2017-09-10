# 123 => "123"

def int_to_str(num)
  return '0' if num == 0

  sign = ''
  if num < 0
    sign << '-'
    num = -num
  end

  str = ''

  until num == 0
    str << (num % 10 + "0".ord).chr
    num /= 10
  end

  sign + str.reverse
end

p int_to_str(-213123)

def str_to_int(str)
  negative = str[0] == '-' ? true : false
  num = 0

  str.each_char do |ch|
    next if ch == '-'
    num = num * 10 + (ch.ord - '0'.ord)
  end

  num = -num if negative
  num
end

p str_to_int("0")
