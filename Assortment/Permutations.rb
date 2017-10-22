def permutation(arr)
  return [arr] if arr.length < 2

  last_el = arr.pop
  perms = permutation(arr)

  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |idx|
      total_perms << perm[0...idx] + [last_el] + perm[idx..-1]
    end
  end

  total_perms
end

p permutation([1, 2, 3])
