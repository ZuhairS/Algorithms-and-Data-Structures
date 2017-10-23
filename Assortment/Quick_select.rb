def quickselect(arr, k)
  loop do
    pivot = arr.delete_at(rand(arr.length))
    left, right = arr.partition { |x| x < pivot }
    if k == left.length
      return pivot
    elsif k < left.length
      arr = left
    else
      k = k - left.length - 1
      arr = right
    end
  end
end
p quickselect([4, 2, 3, 6, 8, 1], 1)
