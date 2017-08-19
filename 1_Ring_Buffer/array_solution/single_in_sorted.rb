def single_in_sorted(arr)
  return arr.first if arr.length == 1

  mid_idx = arr.length / 2
  mid = arr[mid_idx]

  return mid if arr[mid_idx + 1] != mid && arr[mid_idx - 1] != mid

  if mid_idx.even?
    if arr[mid_idx + 1] == mid
      return single_in_sorted(arr[mid_idx + 2..-1])
    else
      return single_in_sorted(arr[0...mid_idx - 1])
    end
  elsif mid_idx.odd?
    if arr[mid_idx + 1] == mid
      return single_in_sorted(arr[0...mid_idx])
    else
      return single_in_sorted(arr[mid_idx + 1..-1])
    end
  end
end

p single_in_sorted([1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8])

# [1, 1, 2, 2, 3], [0, 1, 1, 2, 2]
# mid_idx == even
# Move towards the pair direction
# [3], [0] if no pair
#
# [1, 1, 2, 2, 3, 3, 4], [0, 1, 1, 2, 2, 3, 3]
# mid_idx == odd
# Move away from pair direction
# [3, 3, 4], [0, 1, 1]
# [4], [0]
