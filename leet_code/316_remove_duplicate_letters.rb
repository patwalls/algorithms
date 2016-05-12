def remove_duplicate_letters(str)
  uniq_count = uniqify(str).length
  uniqs = []
  str.length.times do |i|
    (str.length - i).times do |i2|
      next if i == i2
      first = str[i]
      second = str[i2..-1]
      combo = first + uniqify(second)
      uniqs << combo if combo.length == uniq_count && !second.include?(first)
    end
  end
  uniqs.sort[0]
end

def uniqify(str)
  str.split('').uniq.join('')
end

p remove_duplicate_letters('cbacdcbc')

# Given "bcabc"
# Return "abc"
