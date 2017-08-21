require 'binary_search_tree'

def kth_largest(tree_node, k)
  return nil unless tree_node
  reverse_in_order_traversal(tree_node)[k - 1]
end

def reverse_in_order_traversal(tree_node, arr = [])
  return [] unless tree_node
  arr = reverse_in_order_traversal(tree_node.right, arr) if tree_node.right
  arr << tree_node
  arr = reverse_in_order_traversal(tree_node.left, arr) if tree_node.left
  arr
end
