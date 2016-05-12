# def largest_prime_factor(n)
#   factors = factors(n)
#   max_factor = 0
#   factors.each do |factor|
#     if factor > max_factor
#       max_factor = factor
#     end
#   end
#   max_factor
# end

def factors(n)
  i = n - 1
  while i > 0
    return i if n % i == 0
    i -= 1
  end
end

# def is_prime?(n)
#   (2...n).each do |num|
#     return false if n % num == 0
#   end
#   true
# end

p factors(600851475143)
