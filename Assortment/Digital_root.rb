def digital_root_iter(num)
  return num unless num > 9

  until num < 10
    num = digital_root_step(num)
  end
  num
end

def digital_root_step(num)
  new_num = 0
  until num < 10
    new_num += num % 10
    num /= 10
  end

  new_num + num
end

def digital_root_rec(num)
  return num if num < 10
  digital_root_rec(num / 10 + num % 10)
end

p digital_root_iter(123)
p digital_root_rec(123)
