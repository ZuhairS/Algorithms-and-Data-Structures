def edit_distance(str1, str2)
  cache = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  (0..str1.length).each do |idx1|
    (0..str2.length).each do |idx2|
      if idx1 == 0
        cache[idx1][idx2] = idx2
      elsif idx2 == 0
        cache[idx1][idx2] = idx1
      elsif str1[idx1 - 1] != str2[idx2 - 1]
        cache[idx1][idx2] = [
          cache[idx1 - 1][idx2],
          cache[idx1][idx2 - 1],
          cache[idx1 - 1][idx2 - 1]
        ].min + 1
      else
        cache[idx1][idx2] = cache[idx1 - 1][idx2 - 1]
      end
    end
  end

  cache[str1.length][str2.length]
end

p edit_distance('sunday', 'saturday')
