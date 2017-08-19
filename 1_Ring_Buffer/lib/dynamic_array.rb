require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new
    @capacity = 8
  end

  def length
    store.length
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if store.length == 0
    store.pop
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    self.resize!
    store.push(val)
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if store.length == 0
    store.shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.resize!
    store.unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' unless store[index]
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    if store.length == capacity
      new_store = store
      store = StaticArray.new(capacity * 2)
      @capacity *= 2
      new_store.length.times do
        store.push(new_store.pop)
      end
    end
  end
end
