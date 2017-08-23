# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to


require 'graph'
require 'topological_sort'

# def install_order(arr)
#   vertices = {}
#
#   arr.each do |tuple|
#     vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
#     vertices[tuple[1]] = Vertex.new(tuple[0]) unless vertices[tuple[0]] || tuple[1].nil?
#
#     Edge.new(tuple[1], tuple[0]) if tuple[1]
#   end
#
#   topological_sort(vertices.values).map { |vertex| vertex.value }
# end

def install_order(arr)
  vertices = {}
  min, max = arr[0][0], arr[0][0]

  arr.each do |tuple|
    max = tuple.max if max < tuple.max
    min = tuple.min if min > tuple.min

    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[1]) unless vertices[tuple[1]]

    Edge.new(vertices[tuple[1]], vertices[tuple[0]])
  end

  (min..max).each do |value|
    vertices[value] = Vertex.new(value) unless vertices[value]
  end

  topological_sort(vertices.values).map { |vertex| vertex.value }
end
