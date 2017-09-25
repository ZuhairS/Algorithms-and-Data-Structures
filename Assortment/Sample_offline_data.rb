def sample_shuffle(arr, k)
  length = arr.length
  (0...k).each do |idx|
    rand_idx = rand(idx...length)
    arr[idx], arr[rand_idx] = arr[rand_idx], arr[idx]
  end

  arr[0...k]
end

p sample_shuffle([3,2,5,4,9,6], 3)
