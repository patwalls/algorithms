HASH = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
}

def roman_to_int(s)
  largest_position = nil
  max = nil
  s.split('').each_with_index do |letter,i|
    if max.nil? || HASH[letter] > max
      max = HASH[letter]
      largest_position = i
    end
  end
  if largest_position == 0
    left_arr = []
  else
    left_arr = s.split('')[0..(largest_position - 1)]
  end
  right_arr = s.split('')[(largest_position + 1)..-1]
  p left_arr, right_arr
  final = count_down(left_arr) + max + count_up(right_arr)
  final
end

def count_up(arr)
  sum = 0
  arr.each do |letter|
    sum += HASH[letter]
  end
  sum
end

def count_down(arr)
  sum = 0
  arr.each do |letter|
    sum -= HASH[letter]
  end
  sum
end

p roman_to_int("MCMXCVI")
