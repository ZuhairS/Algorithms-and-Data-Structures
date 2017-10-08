def quick_sort(arr)
  return arr if arr.length < 2

  rand_idx = rand(1...arr.length)
  arr[0], arr[rand_idx] = arr[rand_idx], arr[0]

  pivot = arr[0]
  left = arr[1..-1].select { |el| el <= pivot }
  right = arr[1..-1].select { |el| el > pivot }
  quick_sort(left) + [pivot] + quick_sort(right)

end

p quick_sort([6,10,3,4,2,1,6,2,3])
