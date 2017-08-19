class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @next.prev = @prev if @next
    @prev.next = @next if @prev
    @next = nil
    @prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    test_node = @head.next
    until test_node == @tail
      return test_node.val if test_node.key == key
      test_node = test_node.next
    end
  end

  def include?(key)
    test_node = @head.next
    until test_node == @tail
      return true if test_node.key == key
      test_node = test_node.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        return true
      end
    end
  end

  def remove(key)
    test_node = @head.next
    until test_node == @tail
      if test_node.key == key
        test_node.remove
        return true
      end
      test_node = test_node.next
    end
  end

  def each
    test_node = @head.next
    until test_node == @tail
      yield(test_node)
      test_node = test_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
