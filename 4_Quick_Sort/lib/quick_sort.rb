class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.first
    # left, right = [], []

    # array[1..-1].each do |el|
    #   el >= pivot ? right << el : left << el
    # end

    left, right = array.partition { |el| pivot <= el }

    self.sort1(left) + [pivot] + self.sort1(right)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if array.length <= 1
    prc ||= Proc.new { |x, y| x <=> y }

    pivot = partition(array, start, length, &prc)

    left_length = pivot - start
    right_length = length - (left_length + 1)
    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    # pivot = start + rand(length)
    # array[start], array[pivot] = array[pivot], array[start]

    pivot_idx, pivot = start, array[start]
    ((start + 1)...(start + length)).each do |idx|
      if prc.call(pivot, array[idx]) == 1
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end
    array[pivot_idx], array[start] = array[start], array[pivot_idx]
    p array
    pivot_idx
  end
end
