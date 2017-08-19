# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store, :max

  def initialize
    @store = RingBuffer.new
    # @max = nil
    @max_arr = RingBuffer.new
  end

  def enqueue(val)
    @store.push(val)

    while !@max_arr.empty? && @max_arr.last < val
      @max_arr.pop
    end

    @max_arr.push(val)
    # @max = val if @max.nil? || @max < val
  end

  def dequeue
    dequeued_element = @store.shift
    if !@max_arr.empty? && @max_arr[0] == dequeued_element
      @max_arr.shift
    end
  end

  def max
    @max_arr[0] unless @max_arr.empty?
    # @max
  end

  def length
    store.length
  end

end
