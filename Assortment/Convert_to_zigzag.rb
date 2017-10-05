def zigzag(arr)
  less_than = true

  (0...arr.length - 1).each do |idx|
    if less_than
      arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx] unless arr[idx] < arr[idx + 1]
    else
      arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx] unless arr[idx] > arr[idx + 1]
    end
    less_than = !less_than
  end
  arr
end

p zigzag([6,7,3,2,4,5,1,8,9,10])
