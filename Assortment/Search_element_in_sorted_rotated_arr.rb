def search_rotated_sorted_arr(arr, target)
  return nil if arr.empty?

  mid_idx = arr.length / 2

  if arr[mid_idx] == target
    return mid_idx
  elsif arr.first < arr[mid_idx]
    if target < arr[mid_idx] && target >= arr.first
      search_rotated_sorted_arr(arr[0...mid_idx], target)
    else
      rec = search_rotated_sorted_arr(arr[mid_idx + 1..-1], target)
      rec + mid_idx + 1 if rec
    end
  else
    if target <= arr.last && target > arr[mid_idx]
      rec = search_rotated_sorted_arr(arr[mid_idx + 1..-1], target)
      rec + mid_idx + 1 if rec
    else
      search_rotated_sorted_arr(arr[0...mid_idx], target)
    end
  end

end

def search_pivot_rotated_sorted_arr(arr)
  return nil if arr.empty?
  mid_idx = arr.length / 2

  if arr.first < arr[mid_idx] && arr[mid_idx] < arr.last
    return 0
  elsif arr.first > arr[mid_idx]
    search_pivot_rotated_sorted_arr(arr[0...mid_idx])
  elsif arr.first < arr[mid_idx]
    search_pivot_rotated_sorted_arr(arr[mid_idx + 1..-1]) + mid_idx + 1
  end

end

p search_rotated_sorted_arr([5, 6, 7, 8, 9, 1, 2, 3, 4], 4)
p search_pivot_rotated_sorted_arr([5, 6, 7, 8, 9, 1, 2, 3, 4])
