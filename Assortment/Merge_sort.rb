def merge_sort(arr)
  return arr if arr.length < 2

  mid = arr.length / 2

  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end

def merge(left, right)
  merged_arr = []
  until left.empty? || right.empty?
    if left[0] > right[0]
      merged_arr << right.shift
    else
      merged_arr << left.shift
    end
  end

  merged_arr + left + right
end

p merge_sort([6, 2, 5, 3, 1, 4])
