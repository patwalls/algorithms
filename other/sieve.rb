require 'pry'

def sieve(n)
  arr = Array.new(n,1)
  arr[0] = 0
  arr[1] = 0
  i = 2
  while i <= Math.sqrt(n)
    if arr[i] == 1
      j = i * 2
      while j <= n
        arr[j] = 0
      j = j + i
      end
    end
  i += 1
  end
  primes = []
  arr.each_with_index.map do |num,index|
    primes << index if num == 1
  end
  primes
end

p sieve(100)
