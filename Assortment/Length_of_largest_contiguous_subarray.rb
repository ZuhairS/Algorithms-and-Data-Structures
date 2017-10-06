def contiguous_subarray(arr)
  max_length = 0

  (0...arr.length - 1).each do |idx1|
    max, min = arr[idx1], arr[idx1]

    (idx1 + 1...arr.length).each do |idx2|
      max = arr[idx2] if arr[idx2] > max
      min = arr[idx2] if arr[idx2] < min

      if (max - min) == (idx2 - idx1)
        current_length = idx2 - idx1 + 1
        max_length = current_length if current_length > max_length
      end
    end
  end

  max_length
end

p contiguous_subarray([1, 56, 58, 57, 90, 92, 94, 93, 91, 45])
