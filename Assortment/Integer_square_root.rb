def square_root(num)
  return num if num < 4
  low, high = 0, num / 2

  while low <= high
    target = (low + high) / 2
    if target**2 > num
      high = target - 1
    else
      low = target + 1
    end
  end
  low - 1
end

p square_root(81)
