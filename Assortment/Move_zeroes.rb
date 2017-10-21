def move_zeroes(arr)
  current_idx, check_idx = arr.length - 1, arr.length - 1

  until check_idx < 0
    if arr[check_idx] == 0
      arr[current_idx], arr[check_idx] = arr[check_idx], arr[current_idx]
      current_idx -= 1
    end
    check_idx -= 1
  end

  arr
end

p move_zeroes([1, 2, 0, 3, 4, 0, 5, 6, 0])
