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
      current_five_product *= char.to_i
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
[[8, 2, 22, 97, 38, 15, 0, 40, 0, 75, 4, 5, 7, 78, 52, 12, 50, 77, 91, 8],
[49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 4, 56, 62, 0],
[81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 3, 49, 13, 36, 65],
[52, 70, 95, 23, 4, 60, 11, 42, 69, 24, 68, 56, 1, 32, 56, 71, 37, 2, 36, 91],
[22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
[24, 47, 32, 60, 99, 3, 45, 2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
[32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
[67, 26, 20, 68, 2, 62, 12, 20, 95, 63, 94, 39, 63, 8, 40, 91, 66, 49, 94, 21],
[24, 55, 58, 5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
[21, 36, 23, 9, 75, 0, 76, 44, 20, 45, 35, 14, 0, 61, 33, 97, 34, 31, 33, 95],
[78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 3, 80, 4, 62, 16, 14, 9, 53, 56, 92],
[16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 0, 17, 54, 24, 36, 29, 85, 57],
[86, 56, 0, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
[19, 80, 81, 68, 5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 4, 89, 55, 40],
[4, 52, 8, 83, 97, 35, 99, 16, 7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
[88, 36, 68, 87, 57, 62, 20, 72, 3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
[4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 8, 46, 29, 32, 40, 62, 76, 36],
[20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 4, 36, 16],
[20, 73, 35, 29, 78, 31, 90, 1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 5, 54],
[1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 1, 89, 19, 67, 48]]
# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
# What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

def greatest_product_of_four(grid)
  nums_in_prod = 4
  grid_length = 20
  greatest_product = 0
  col = 0
  row = 0
  while row < 20
    while col < 20
      # horizontally
      puts "col #{col}"
      if col <= (grid_length - nums_in_prod)
        current_product = grid[row][col]
        puts current_product
        index = 1
        while index < nums_in_prod
          puts grid[row][col + index]
          current_product *= grid[row][col + index]
          index += 1
        end
        puts 'done'
        greatest_product = [current_product, greatest_product].max
      end
      # vertically
      if col <= (grid_length - nums_in_prod) && (row <= 16)
        current_product = grid[row][col]
        index = 1
        while index < nums_in_prod
          current_product *= grid[row + index][col]
          index += 1
        end
        greatest_product = [current_product, greatest_product].max
      end
      # diagonally up / forwards
      if (row <= (grid_length - nums_in_prod)) && (col >= nums_in_prod)
        current_product = grid[row][col]
        index = 1
        while index < nums_in_prod
          current_product *= grid[row + index][col - index]
          index += 1
        end
        greatest_product = [current_product, greatest_product].max
      end
      # diagonally down / forwards
      if (col <= (grid_length - nums_in_prod)) && (row <= (grid_length - nums_in_prod))
        current_product = grid[row][col]
        index = 1
        while index < nums_in_prod
          current_product *= grid[row + index][col + index]
          index += 1
        end
        greatest_product = [current_product, greatest_product].max
      end
      col += 1
    end
    col = 0
    row += 1
  end
  return greatest_product
end

# puts greatest_product_of_four(grid)

# ====================
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# Let us list the factors of the first seven triangle numbers:
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?

def find_500_divisors
  triangle_num = 0
  natural_num = 1
  divisors = 0
  while divisors < 500
    triangle_num += natural_num
    if triangle_num > 500
      divisor = 1
      divisors = 0
      sqrt = Math.sqrt(triangle_num)
      while divisor <= sqrt
        if triangle_num % divisor == 0
          divisors += 2
        end
        divisor += 1
      end
      if sqrt * sqrt == triangle_num
        divisors -= 1
      end
    end
    natural_num += 1
  end
  return triangle_num
end
require 'time'
# puts Time.now
# puts find_500_divisors
# puts Time.now

# ====================
# Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
def first_ten_digits
  sum = 0
  File.open('largesum.txt') do |file|
    file.each_line do |line|
      sum += line.to_i
    end
  end
  return sum.to_s[0..9].to_i
end

# puts first_ten_digits

# ====================
# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

def collatz
  longest_chain = 1
  longest_starting = 1
  starting_num = 1
  while starting_num < 1000000
    n = starting_num
    chain = 1 # accounting for 1, the end of every chain
    while n != 1
      if n.even?
        n = n/2
      else
        n = 3*n + 1
      end
      chain += 1
    end
    if chain > longest_chain
      longest_chain = chain
      longest_starting = starting_num
    end
    starting_num += 1
  end
  return longest_starting
end

puts collatz


