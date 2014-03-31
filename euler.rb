require 'debugger'
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
require 'prime'
num = 600851475143

def prime_factors(num)
  orig_num = num
  prime = 3
  prime_factor_nums = []
    while num >= prime
      if num % prime == 0
        prime_factor_nums << prime
      end
      puts prime_factor_nums
      prime = next_prime(prime)
    end
  return prime_factor_nums
end

def next_prime(prime)
  prime = prime + 1
  while Prime.prime?(prime) == false
    prime += 1
  end
  return prime
end

puts prime_factors(num)

# also, ruby has a class for this...
# Prime.prime_division(num)

# ====================
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.




