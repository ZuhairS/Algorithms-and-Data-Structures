require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# def topological_sort(vertices)
#   sorted_arr = []
#   visited = Hash.new(false)
#
#   vertices.each do |vertex|
#     sorted_arr = tarjan(vertex, visited, sorted_arr) unless visited[vertex]
#     return [] if sorted_arr.empty?
#   end
#
#   sorted_arr
# end
#
# def tarjan(vertex, visited, sorted_arr)
#   return [] if visited[vertex]
#   visited[vertex] = true
#
#   vertex.out_edges.each do |edge|
#     new_vertex = edge.to_vertex
#     sorted_arr = tarjan(new_vertex, visited, sorted_arr) unless visited[new_vertex]
#     return [] if sorted_arr.empty?
#   end
#
#   sorted_arr.unshift(vertex)
# end

def topological_sort(vertices)
  queue = Queue.new
  sorted_arr = []
  in_edges_count = {}

  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
    in_edges_count[vertex] = vertex.in_edges.length
  end

  until queue.empty?
    test_vertex = queue.shift

    sorted_arr << test_vertex
    test_vertex.out_edges.each do |edge|
      destination_vertex = edge.to_vertex
      in_edges_count[destination_vertex] -= 1
      queue << destination_vertex if in_edges_count[destination_vertex].zero?
    end
  end

  return [] if sorted_arr.length < vertices.length
  sorted_arr
end
