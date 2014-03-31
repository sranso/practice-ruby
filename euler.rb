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

# puts prime_factors(num)

# also, ruby has a class for this...
# Prime.prime_division(num)

# ====================
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
def largest_palindrome_from_two_three_digit_nums
  x = 100
  y = 100
  largest_product = 0
  while x <= 999
    while y <= 999
      product = x * y
      if product.to_s == product.to_s.reverse
        largest_product = product if product > largest_product
      end
      y += 1
    end
    x += 1
    y = x
  end
  return largest_product
end
puts largest_palindrome_from_two_three_digit_nums

# 913*993=906609

