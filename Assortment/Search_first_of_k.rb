def search_first_k(arr, target)
  return 0 if arr.length == 1
  left_idx, right_idx = 0, arr.length - 1
  result = -1
  until left_idx > right_idx
    mid = (left_idx + right_idx) / 2
    if arr[mid] > target
      right_idx = mid - 1
    elsif arr[mid] < target
      left_idx = mid + 1
    else
      result = mid
      right_idx = mid - 1
    end
  end
  result
end

p search_first_k([1,2,3,3,3,4,5,6,6,6,6,6], 6)
