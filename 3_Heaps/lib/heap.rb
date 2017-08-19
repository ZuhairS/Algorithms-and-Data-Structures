class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new

    @prc ||= Proc.new { |x, y| x <=> y }
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &prc)
    extracted
  end

  def peek
    @store.first
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count - 1, &prc) if count > 1
  end

  public
  def self.child_indices(len, parent_index)
    first_child = 2 * parent_index + 1
    second_child = 2 * parent_index + 2
    raise 'out of range' if parent_index < 0 || parent_index >= len
    children = []
    children << first_child if first_child < len
    children << second_child if second_child < len
    children
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    child_indices = BinaryMinHeap.child_indices(len, parent_idx)

    left_child_idx, right_child_idx = child_indices

    children = []
    children << array[left_child_idx] if left_child_idx
    children << array[right_child_idx] if right_child_idx

    until children.all? { |child| prc.call(array[parent_idx], child) <= 0 }
      smaller_child_idx = nil
      if children.length == 1
        smaller_child_idx = left_child_idx
      else
        smaller_child_idx =
          prc.call(children[0], children[1]) == -1 ? left_child_idx : right_child_idx
      end
      array[parent_idx], array[smaller_child_idx] = array[smaller_child_idx], array[parent_idx]

      parent_idx = smaller_child_idx
      child_indices = BinaryMinHeap.child_indices(len, parent_idx)

      left_child_idx, right_child_idx = child_indices

      children = []
      children << array[left_child_idx] if left_child_idx
      children << array[right_child_idx] if right_child_idx
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    parent_idx = parent_index(child_idx)

    until prc.call(array[child_idx], array[parent_idx]) >= 0
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      break if parent_idx == 0
      child_idx = parent_idx
      parent_idx = parent_index(child_idx)
    end
    array
  end
end
