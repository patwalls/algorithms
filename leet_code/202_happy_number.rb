def is_happy(n,orig=nil)
    return false if n == orig
    digit_arr = single_digits(n)
    return true if sum_of_digits(digit_arr) == sum_of_squares(digit_arr)
    p sum_of_squares(digit_arr)
    p orig
    is_happy(sum_of_squares(digit_arr), (orig.nil? ? n : orig))
end


def single_digits(num)
    nums = []
    while num > 0
        digit = num % 10
        num /= 10
        nums.unshift(digit)
    end
    nums
end

def sum_of_squares(arr)
    sum = 0
    arr.each do |num|
        sum += (num * num)
    end
    sum
end

def sum_of_digits(arr)
    arr.reduce(:+)
end

p is_happy(4)
