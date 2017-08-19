## 500 files

# You are given 500 files, each containing the stock trading data for a
# company. Within each file all the trades have timestamps.
# The timestamps appear in ascending order. Your job is to create one
# file of all data in ascending time order. Achieve the best Time and
# Space complexity that you can, and don't modify the inputs.

require_relative "heap"

def five_hundred_files(arr_of_arrs)
  prc = Proc.new { |x, y| x[0] <=> y[0] }
  heap = BinaryMinHeap.new(&prc)
  result = []

  arr_of_arrs.each_index do |idx|
    heap.push([arr_of_arrs[idx][0], idx, 0])
  end


  while heap.count > 0

    min = heap.extract
    result << min[0]

    next_arr_i = min[1]
    next_idx = min[2] + 1
    next_el = arr_of_arrs[next_arr_i][next_idx]

    heap.push([next_el, next_arr_i, next_idx]) if next_el
  end
  result

end

arr_of_arrs = [[3, 5, 7], [0, 6], [0, 6, 28]]

five_hundred_files(arr_of_arrs)
