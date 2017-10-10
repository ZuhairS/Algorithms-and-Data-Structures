class Graph

  attr_accessor :vertices, :graph

  def initialize(vertices)
    @vertices = vertices
    @graph = Hash.new { |h, k| h[k] = [] }
  end

  def add_edge(u, v)
    @graph[u] << v
  end

end

class DisjointSet

  def initialize(size)
    @set = [-1] * size
  end

  def find_root(u)
    if @set[u] == -1
      u
    else
      find_root(@set[u])
    end
  end

  def connected?(u, v)
    find_root(u) == find_root(v)
  end

  def union(u, v)
    @set[find_root(u)] = find_root(v)
  end

end

def is_cyclic?(graph)
  set = DisjointSet.new(graph.vertices)

  graph.graph.each do |u, arr|
    arr.each do |v|
      return true if set.connected?(u, v)
      set.union(u, v)
    end
  end
  false
end

graph = Graph.new(4)
graph.add_edge(0, 1)
graph.add_edge(1, 2)
graph.add_edge(2, 0)

p is_cyclic?(graph)
