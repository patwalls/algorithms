def perms(str, elmt='')
  if str.length == 0
    return elmt
  else
    str.each_char do |char1|
      temp_str = ''
      str.each_char do |char2|
        temp_str += char2 unless char1 == char2
      end
      perms = perms(temp_str, char1 + elmt)
    end
    permutations = []
    permutations << perms
  end
  permutations
end

p perms('abc')

def permutations(arr)
  return [[]] if arr.empty?

  perms = []
  arr.length.times do |i|
    # Choose an element to be first
    el = arr[i]
    rest = arr.take(i) + arr.drop(i + 1)

    # Find permutations of the rest, and tack the first `el` at front.
    new_perms = permutations(rest).map { |perm| perm.unshift(el) }
    perms.concat(new_perms)
  end

  perms
end
