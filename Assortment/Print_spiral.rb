def print_spiral(matrix)
  result = []

  until matrix.empty? || matrix[0].empty?
    result += matrix.shift
    break if matrix.empty? || matrix[0].empty?

    matrix.each { |arr| result << arr.pop }
    break if matrix.empty? || matrix[0].empty?

    result += matrix.pop.reverse
    break if matrix.empty? || matrix[0].empty?

    matrix.reverse.each { |arr| result << arr.shift }
  end

  result
end

matrix = [[1, 2, 3, 4],
          [5, 6, 7, 8],
          [9, 10, 12, 11],
          [13, 14, 15, 16]]

p print_spiral(matrix)
