class Graph

  attr_accessor :vertices, :graph

  def initialize(vertices)
    @vertices = vertices
    @graph = Hash.new { |h, k| h[k] = [] }
  end

  def add_edge(u, v)
    @graph[u] << v
  end

  def is_cyclic?
    set = DisjointSet.new(@vertices)

    @graph.each do |u, arr|
      arr.each do |v|
        return true if set.connected?(u, v)
        set.union(u, v)
      end
    end
    false
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

graph = Graph.new(4)
graph.add_edge(0, 1)
graph.add_edge(1, 2)
graph.add_edge(2, 0)
p graph.is_cyclic?
