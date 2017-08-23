# Post Order Traversal:

def post_order_traversal(tree_node, arr = [])
  return [] if tree_node.nil?
  arr += post_order_traversal(tree_node.left, arr) if tree_node.left
  arr += post_order_traversal(tree_node.right, arr) if tree_node.right
  arr << tree_node
  arr
end

# Pre Order Traversal:

def pre_order_traversal(tree_node, arr = [])
  return [] if tree_node.nil?
  arr << tree_node
  arr += pre_order_traversal(tree_node.left, arr) if tree_node.left
  arr += pre_order_traversal(tree_node.right, arr) if tree_node.right
  arr
end

# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.

# def lowest_common_ancestor(bst, node1, node2)
#   return bst.root if (node1.value < bst.root && node2.value > bst.root) || (node1.value > bst.root && node2.value < bst.root)
# end

# Recursive:
def lca(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  if tree_node.value >= smaller && tree_node.value <= bigger
    lca = tree_node
  elsif tree_node.value > smaller && tree_node.value > bigger
    lca = lca(tree_node.left, node1, node2)
  elsif tree_node.value < smaller && tree_node.value < bigger
    lca = lca(tree_node.right, node1, node2)
  end

  lca
end


# Iterative:
def lca_iter(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  while !(tree_node.value >= smaller && tree_node.value <= bigger)
    if tree_node.value > smaller && tree_node.value > bigger
      tree_node = tree_node.left
    elsif tree_node.value < smaller && tree_node.value < bigger
      tree_node = tree_node.right
    end
  end

  tree_node
end
