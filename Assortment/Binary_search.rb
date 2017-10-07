def bs_iter(arr, target)
  return arr.first if arr.length < 2

  start_idx, end_idx = 0, arr.length - 1

  while start_idx <= end_idx
    mid = (start_idx + end_idx) / 2
    if arr[mid] == target
      return mid
    elsif arr[mid] > target
      end_idx = mid - 1
    else start_idx = mid + 1
    end
  end
  nil
end

def bs_rec(arr, target)
  return nil if arr.empty?

  mid = arr.length / 2

  if arr[mid] == target
    return mid
  elsif arr[mid] > target
    bs_rec(arr[0...mid], target)
  else
    bs_idx = bs_rec(arr[mid + 1..-1], target)
    mid + bs_idx + 1 if bs_idx
  end
end

p bs_iter([2, 3, 4, 10, 40], 10)
p bs_rec([2, 3, 4, 10, 40], 10)
