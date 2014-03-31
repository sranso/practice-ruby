# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
require 'prime'
require 'debugger'
# num = 600851475143
num = 20
def prime_factors(num)
  orig_num = num
  prime = 3
  prime_factor_nums = []
  while num != 1
    while num % prime != 0
      debugger
      prime += 1
      # prime = next_prime(prime)
    end
    debugger
    prime_factor_nums << prime
  end
  debugger
  return prime_factor_nums
end

def next_prime(prime)
  prime = prime + 1
  while Prime.prime?(prime) == false
    prime += 1
  end
  debugger
  return prime
end

puts prime_factors(num)

# also, ruby has a class for this...
# Prime.prime_division(num)