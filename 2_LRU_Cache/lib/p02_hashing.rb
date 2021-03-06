class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    arr_hash = 0
    each_with_index do |el, idx|
      arr_hash += (el.hash + idx.hash) ^ arr_hash
    end
    arr_hash
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort.hash
  end
end
