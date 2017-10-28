def rotate_by_90(matrix)
  return [[]] if matrix.empty?

  (0...matrix.length / 2).each do |layer|
    first = layer
    last = matrix.length - 1 - layer
    (first...last).each do |idx|
      offset = idx - first
      top = matrix[first][idx]
      matrix[first][idx] = matrix[last - offset][first]
      matrix[last - offset][first] = matrix[last][last - offset]
      matrix[last][last - offset] = matrix[idx][last]
      matrix[idx][last] = top
    end
  end

  matrix
end

matrix = [[1, 1, 1],
          [2, 2, 2],
          [3, 3, 3]]

p rotate_by_90(matrix)
