def trailing_zeros(n)
  fact = factorial(n)
  iteration = 10
  i = 0
  while true
    return i if fact % iteration != 0
    iteration *= 10
    i += 1
  end
end


def factorial(n)
    return 1 if n == 1
    return n * factorial(n - 1)
end

def reverse_number(num)
  rev = 0
  n = num
  until n == 0
    digit = n % 10
    rev = rev * 10 + digit
    n = n / 10
  end
  rev
end

p reverse_number(98765432)
