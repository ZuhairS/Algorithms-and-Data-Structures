def insertion_sort(arr)
  return arr if arr.length < 2

  arr.each_with_index do |el, idx|
    pivot_idx = idx - 1
    while pivot_idx >= 0 && arr[pivot_idx] > el
      arr[pivot_idx + 1] = arr[pivot_idx]
      pivot_idx -= 1
    end

    arr[pivot_idx + 1] = el
  end

  arr
end

p insertion_sort([9,7,6,5,2,1,10,4])
