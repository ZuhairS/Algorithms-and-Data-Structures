require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @start_idx = 0
    @count = 0
  end

  def length
    @count
  end

  def capacity
    @store.length
  end

  def empty?
    @count == 0
  end

  def last
    @store[@count - 1]
  end

  # O(1)
  def [](index)
    check_index(index)
    ring_index = (start_idx + index) % capacity
    @store[ring_index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)

    # if index == @count
    #   self.resize!
    #   @count += 1
    # end

    ring_index = (start_idx + index) % capacity
    @store[ring_index] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @count == 0
    last_index = (start_idx + (@count - 1)) % capacity
    @count -= 1
    store[last_index]
  end

  # O(1) ammortized
  def push(val)
    self.resize!
    new_last_index = (start_idx + @count) % capacity
    store[new_last_index] = val
    @count += 1
  end

  # O(1)
  def shift
    raise 'index out of bounds' if @count == 0
    @count -= 1
    first_element = store[start_idx]
    @start_idx = (start_idx + 1) % capacity
    first_element
  end

  # O(1) ammortized
  def unshift(val)
    self.resize!
    @start_idx = (start_idx - 1) % capacity
    @store[start_idx] = val
    @count += 1
  end

  protected

  attr_accessor :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @count || index < 0
  end

  def resize!
    if @count == capacity
      new_store = StaticArray.new(capacity * 2)
      (0...length).each do |idx|
        new_store[idx] = self[idx]
      end
      @store = new_store
      @start_idx = 0
    end
  end
end
