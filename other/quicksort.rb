def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr[0]
  left = []
  right = []
  i = 1
  while i < arr.length
    if arr[i] >= pivot
      right << arr[i]
    else
      left << arr[i]
    end
    i += 1
  end
  return quicksort(left).concat([pivot]).concat(quicksort(right))
end

p quicksort([6,2,8,9,1,2,5,1,9,3,8,0,12,3])
