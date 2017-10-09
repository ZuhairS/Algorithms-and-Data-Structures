def quick_select_kth_smallest(arr, k)

  # return nil if k > arr.length || k <= 0
  loop do
    pivot_idx = rand(arr.length)
    arr[0], arr[pivot_idx] = arr[pivot_idx], arr[0]
    left, right = arr[1..-1].partition { |el| el < arr[pivot_idx] }

    if k == left.length
      return arr[pivot_idx]
    elsif k < left.length
      arr = left
    else
      k = k - left.length - 1
      arr = right
    end
  end
end

p quick_select_kth_smallest([4,2,3,6,8,1], 1)
