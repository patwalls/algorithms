def title_to_number(s)
    arr = s.split('')
    accum = 0
    i = arr.length - 1
    arr.each do |letter|
        number = letter.ord - 'A'.ord + 1
        p number
        accum += (number * (26 ** i))
        i -= 1
    end
    accum
end

p title_to_number('AA')
