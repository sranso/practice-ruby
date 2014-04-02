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
# puts largest_palindrome_from_two_three_digit_nums
# 913*993=906609

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
def smallest_positive
  divisibles =* (1..19)
  answer = 20
  answer_not_found = true
  while answer_not_found
    divisibles.each do |num|
      if answer % num != 0
        answer += 20
        break
      end
      answer_not_found = false if num == 19
    end
  end
  return answer
end

# puts smallest_positive

# ====================
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
def sum_of_squares
  nums =* (1..100)
  sum = 0
  nums.each do |num|
    sum += num*num
  end
  return sum
end

def square_of_sums
  nums =* (1..100)
  sum = nums.inject { |sum, num| sum + num }
  return sum * sum
end

def difference
  square_of_sums - sum_of_squares
end
# puts difference

# ====================
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10001st prime number?

def find_prime
  num = 2
  prime_count = 1
  while prime_count < 10001
    num += 1
    if Prime.prime?(num)
      prime_count += 1
    end
  end
  return num
end

# puts find_prime

# ====================
# Find the greatest product of five consecutive digits in the 1000-digit number.
huge_number = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

def greatest_product(huge_number)
  range_start = 0
  range_end = 4
  huge_number_str = huge_number.inspect
  largest_product = 0
  while range_end < huge_number_str.length
    current_five = huge_number_str[range_start..range_end]
    current_five_product = 1
    current_five.each_char do |char|
      current_five_product = current_five_product * char.to_i
    end
    largest_product = current_five_product if current_five_product > largest_product
    range_start += 1
    range_end += 1
  end
  return largest_product
end
# puts greatest_product(huge_number)

# ====================



