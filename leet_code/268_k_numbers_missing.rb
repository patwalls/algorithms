# find difference in all numbers added
# find all combinations between 1 and n that could add up to n
# divide those combos from expected factorial until it equals actual


def k_numbers_missing(arr,n)
  nums_missing = (1..n).to_a.length - arr.length

  expected_sum = (1..n).to_a.reduce(:+)
  actual_sum = arr.reduce(:+)

  expected_factorial = (1..n).to_a.reduce(:*)
  actual_factorial = arr.reduce(:*)

  sum_diff = expected_sum - actual_sum
  combos = all_number_combos(sum_diff,nums_missing)

  combos.each do |combo|
    set = expected_factorial
    combo.each do |num|
      if set / num == actual_factorial
        return combo
      else
        set = set / num
      end
    end
  end
end

def all_number_combos(n,k)
  combos = []
  array = (1..n).to_a
  (array.length / k).times do |i|
    combo = [array[i]]
    array[(i + 1)..(array.length - 1)].each do |elx|
      combo_sum = combo.reduce(:+)
      new_combo_sum = combo_sum + elx
      if combo.length == (k - 1) && new_combo_sum == n
        combo << elx
        combos << combo
      elsif new_combo_sum > n
        break
      elsif new_combo_sum < n
        combo << elx
      end
    end
  end
  combos
end


p all_number_combos(12,3)

# p k_numbers_missing([9, 10, 7, 6, 1, 8, 3, 4],10)
