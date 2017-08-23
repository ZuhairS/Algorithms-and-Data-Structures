# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require 'bst_node'

class BinarySearchTree
  attr_accessor :root
  attr_reader :depth

  def initialize
  end

  def insert(value)
    root.nil? ? @root = BSTNode.new(value) : insert_recurse(value, root)
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if value < tree_node.value
      return find(value, tree_node.left) if tree_node.left
    elsif value > tree_node.value
      return find(value, tree_node.right) if tree_node.right
    end
    nil
  end

  def delete(value)
    @root = delete_recurse(value, root)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    max_node = tree_node
    max_node = max_node.right until max_node.right.nil?
    max_node
  end

  def depth(tree_node = @root)
    return -1 unless tree_node
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    return false if (depth(tree_node.left) - depth(tree_node.right)).abs > 1
    is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] unless tree_node
    arr = in_order_traversal(tree_node.left, arr) if tree_node.left
    arr << tree_node.value
    arr = in_order_traversal(tree_node.right, arr) if tree_node.right
    arr
  end

  def self.depth(tree_node)
    return -1 unless tree_node
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end

  private
  # optional helper methods go here:

  def delete_recurse(value, parent)
    if value == parent.value
      if parent.left.nil? && parent.right.nil?
        nil
      elsif parent.left && parent.right
        replacement_node = maximum(parent.left)
        replacement_node.parent.right = replacement_node.left
        replacement_node
      else
        parent.left || parent.right
      end
    elsif value < parent.value
      parent.left = delete_recurse(value, parent.left) if parent.left
    elsif value > parent.value
      parent.right = delete_recurse(value, parent.right) if parent.right
    end
  end

  def insert_recurse(value, parent)
    if value <= parent.value
      if parent.left
        insert_recurse(value, parent.left)
      else
        parent.left = BSTNode.new(value)
        parent.left.parent = parent
      end
    elsif value > parent.value && parent.right
      insert_recurse(value, parent.right)
    else
      parent.right = BSTNode.new(value)
      parent.right.parent = parent
    end
  end

end
