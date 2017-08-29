class DynamicProgramming

  def initialize
    @blair_cache = {
      1 => 1,
      2 => 2
    }

    @frog_hops = {
      1 => [[1]]
    }
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + (2 * (n-1) - 1)
    @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }

    return cache if n <= 1

    # (4..n).each do |num|
    #   cache[num] = []
    #   cache[num - 1].each do |arr|
    #     arr1 = arr.dup << 1
    #     cache[num] << arr1
    #     last = arr[-1] + 1
    #     unless last > 3
    #       arr2 = arr[0...-1] + [last]
    #       cache[num] << arr2
    #     end
    #   end
    # end

    # Nicks
    (4..n).each do |num|
      cache[num] = []
      (1..3).each do |prev|
        cache[num] += cache[num - prev].map { |arr| arr + [prev] }
      end
    end

    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_hops[n] if @frog_hops[n]

    @frog_hops[n] = []
    frog_hops_top_down_helper(n - 1).each do |arr|
      @frog_hops[n] << arr + [1]
      @frog_hops[n] << arr[0...-1] + [arr[-1] + 1] if arr[-1] + 1 <= 3
    end

    @frog_hops[n]
  end

  def super_frog_hops(n, k)
    return [[1]] if n == 1

    jump = []
    super_frog_hops(n - 1, k).each do |arr|
      jump << arr + [1]
      jump << arr[0...-1] + [arr[-1] + 1] if arr[-1] + 1 <= k
    end
    jump
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    cache = [[0, 0, 0]]
    return cache[-1] if capacity <= 0
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
