def intersect(arr1, arr2)
  intersect_arr = []
  idx1, idx2 = 0, 0

  while idx1 < arr1.length && idx2 < arr2.length
    if arr1[idx1] == arr2[idx2]
      intersect_arr << arr1[idx1]
      idx1 += 1
      idx2 += 1
    elsif arr1[idx1] > arr2[idx2]
      idx2 += 1
    else
      idx1 += 1
    end
  end

  intersect_arr
end

p intersect([1,2,3,4],[1,3,7,8])
