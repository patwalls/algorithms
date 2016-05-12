def quick_sort_2(array)
  return array if array.length <= 1
  pivot = array.shift
  left_arr = []
  right_arr = []
  array.each do |num|
    if num <= pivot
      left_arr << num
    else
      right_arr << num
    end
  end
  quick_sort_2(left_arr).concat([pivot]).concat(quick_sort_2(right_arr))
end

p quick_sort_2([2,8,1,0,10,3,6])
