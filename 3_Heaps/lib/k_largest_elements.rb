require_relative 'heap'

def k_largest_elements(array, k)
  k_largest_elements = []
  min_heap = BinaryMinHeap.new

  (0...k).each do |idx|
    min_heap.push(array[idx])
  end

  (k...array.length).each do |idx|
    if array[idx] > min_heap.peek
      min_heap.extract
      min_heap.push(array[idx])
    end
  end

  min_heap.store

end
