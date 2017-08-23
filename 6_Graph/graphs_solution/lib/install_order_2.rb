require 'graph'
require 'topological_sort'

def install_order2(arr)
  vertices = {}

  arr.each do |tuple|
    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[0]) unless vertices[tuple[0]] || tuple[1].nil?

    Edge.new(tuple[1], tuple[0]) if tuple[1]
  end

  topological_sort(vertices.values).map { |vertex| vertex.value }

end
