def largest_continuous_sum(arr)
  max = nil
  current_sum = 0
  arr.each do |num|
    if max.nil? || current_sum + num >= max
      current_sum += num
      max = current_sum
    else
      current_sum = 0
    end
  end
  max
end

p largest_continuous_sum([-24,-12,-8,-32])
