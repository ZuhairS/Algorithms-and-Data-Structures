require_relative "heap"

class Array
  def heap_sort!
    max_heap_prc = Proc.new { |x, y| y <=> x }
    (1...self.length).each do |idx|
      BinaryMinHeap.heapify_up(self, idx, idx + 1, &max_heap_prc)
    end

    (1...self.length).to_a.reverse.each do |idx|
      self[idx], self[0] = self[0], self[idx]
      BinaryMinHeap.heapify_down(self, 0, idx, &max_heap_prc)
    end
  end
end
