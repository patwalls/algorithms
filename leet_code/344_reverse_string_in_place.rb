def reverse_string_in_place(str)
  (str.length / 2).times do |i|
    str[i],str[str.length - 1 - i] = str[str.length - 1 - i],str[i]
  end
  str
end

p reverse_string_in_place('patrick wefkjsdf')
