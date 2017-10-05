def count_triplets(arr, target)
  count = 0
  arr.sort!

  (0...arr.length - 2).each do |idx|
    left_idx, right_idx = idx + 1, arr.length - 1
    while left_idx < right_idx
      sum = arr[idx] + arr[left_idx] + arr[right_idx]

      if sum < target
        count += (right_idx - left_idx)
        left_idx += 1
      else
        right_idx -= 1
      end
    end
  end
  count
end

p count_triplets([5, 1, 3, 4, 7], 12)
