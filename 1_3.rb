def urlify(str,chars)
  ## count spaces
  spaces = 0
  chars.times do |i|
    if str[i] == ' '
      spaces += 1
    end
  end
  chars += spaces * 2
  chars.times do |i
end

p urlify('i like food        ', 11)
