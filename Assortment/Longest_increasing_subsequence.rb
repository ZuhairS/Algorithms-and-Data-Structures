def lis(arr)
  cache = Array.new(arr.length, 1)

  (1...arr.length).each do |idx1|
    idx2 = 0
    while idx2 < idx1
      if arr[idx2] < arr[idx1]
        cache[idx1] = cache[idx2] + 1 if cache[idx1] < cache[idx2] + 1
      end
      idx2 += 1
    end
  end

  cache.max
end

p lis([10, 22, 9, 33, 21, 50, 41, 60])
p lis([3, 10, 2, 1, 20])
p lis([50, 3, 10, 7, 40, 80])
p lis([3, 2])
