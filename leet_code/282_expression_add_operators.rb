RESULT = []

OPERATORS = ['plus','minus']

def add_operators(num, target)
    arr = num.split('')
    initial_accum = arr[0].to_i
    possibilities(arr,0)
end

def possibilities(arr,i,accum=nil)
    return arr[i].to_i if i == arr.length - 1
    accum = arr[i].to_i
    OPERATORS.each do |operator|
      if operator == 'plus'
        p accum
        return accum += possibilities(arr,i + 1,accum)
      elsif operator == 'minus'
        p accum
        return accum -= possibilities(arr,i + 1,accum)
      end
    end
    RESULT
end


p add_operators('123',6)


# base case - return value if at the end of array
# pass in accumulated value and add the next element
