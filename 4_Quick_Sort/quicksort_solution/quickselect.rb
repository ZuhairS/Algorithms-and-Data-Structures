class Array

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
    pivot_idx
  end

  def select_kth_smallest(k)
    left = 0
    right = self.length - 1
    while true
      return self[left] if left == right
      pivot = Array.partition(self, left, right - left + 1)

      if k - 1 == pivot
        return self[k - 1]
      elsif k - 1 < pivot
        right = pivot - 1
      else
        left = pivot + 1
      end
    end
  end
end

arr = [1,4,2,5,3,5]
p arr.select_kth_smallest(1)
p arr.select_kth_smallest(2)
p arr.select_kth_smallest(3)
p arr.select_kth_smallest(4)
p arr.select_kth_smallest(5)
p arr.select_kth_smallest(6)
