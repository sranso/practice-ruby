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
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def find_pythagorean_triplet
  sum = 100
  a = 3
  bb = 4
  # cc = 0
  # while a < sum/3
    while bb < sum/2
      if a**2 + bb**2 == 1000
        cc = Math.sqrt(sum - a**2 - bb**2)
        break
      end
      # bb += 1
    end
    # a += 1
    # bb = a
  # end
  puts a
  puts bb
  puts cc
  return a * bb * cc
end

# puts find_pythagorean_triplet

# ====================
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

def sum_primes
  num = 3
  sum = 2 # first prime is 2
  while num < 2000000
    if Prime.prime?(num)
      sum += num
    end
    num += 2 # the distance b/t all primes except b/t 2 and 3 is at least 2. this is faster than adding just one each time!
  end
  return sum
end
# puts sum_primes
# 142913828922
# http://en.wikipedia.org/wiki/Prime_gap

# ====================
# In the 20×20 grid below, four numbers along a diagonal line have been marked in red.
grid = 
[[08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08],
[49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00],
[81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65],
[52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91],
[22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80],
[24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50],
[32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70],
[67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21],
[24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72],
[21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95],
[78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92],
[16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57],
[86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58],
[19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40],
[04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66],
[88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69],
[04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36],
[20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16],
[20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54],
[01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48]]
# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
# What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?


