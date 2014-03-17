require 'debugger'
# 1) Given a circular list of integers (when you reach the end of the list you come back to the beginning), what is the most efficient algorithm to find the smallest integer in the list?

# For example: 
# circular_list = [22, 52, 66, 82, 5, 8, 12, 19]
  # go through each item in array, set it equal to var if it's smaller than the previous one
  # OR go through each item in the array until the current number is less than the previous number. at that point, you've reached the smallest item in the array
  # def find_smallest(list)
  #   count = 0
  #   while count < list.length
  #     previous_int = list[-1]
  #     list.each do |int|
  #       if int < previous_int
  #         return int
  #       end
  #       count += 1
  #       previous_int = int
  #       if count == list.length
  #         return previous_int
  #       end
  #     end
  #   end
  # end

  def find_smallest(list)
    return list.min
  end

# 2) Write a function that takes an integer and returns the smallest number that is greater than the given number which is a palendrome.

# For example, if the input was 111 the next palindromic number would be 121.
  # if number is odd number of digits, find the middle int and increase it by one
  # if number is even number of digits, find middle two ints and increase by one
  # if the middle int is 9, then increase the ints to its left and right by one and make the middle int zero.
  # if outer ints are 9 and inner int is 9, 
  def next_palendrome(palendrome)
    
  end
  
# 3) The least common multiple of a set of integers is the smallest positive integer that is a multiple of all of the integers in the set.

# Write a function that takes an array of integers and efficiently calculates and returns the LCM.

# 4) Explain the difference between a symbol and a string.

# 5) What is the purpose of yield

# 6) What is a Range?

# 7) What is the difference between ‘&&’, ‘and’ and ‘&’ operators?

# 8) What is a module?

# 9) How can you define a custom Exception?

# 10) What do controllers do in Rails?

# 11) What is RESTful routing?

# 12) What is the purpose of a layout?

# 13) What is Rake?

# 14) What is Capistrano?

# 15) How do you create a has many through relationship?

# 16) What is fields_for used for?

# 17) What is interpolation?

# 18) Reverse the string "question" in place.

# 19) Explain the difference between class and instance variables

# 20) What is a mixin? What is the difference compared with classical inheritance?

# 21) Write a method that turns the string "Hi my name is Bob" into "iH ym eman si boB"

# 22) Explain "convention over configuration."

# 23) What is ORM?

# 24) What is a session?

# 25) What is a namespace?

# 26) What’s the difference between authorization and authentication?

# 27) Explain this ruby idiom: y ||= z

# 28) What does self mean?

# 29) Give me an example of recursion.

# 30) How do redirect and render differ?

# 31) Explain what ‘has_many’ is and what happens when it is run.

# 32) What’s the difference between PUT and POST?

# 33) Explain why in ruby nil.object_id is equal to 4.

# 34) How would I revert to a previous commit?

# 35) What are different types of joins in SQL?

# 36) What data structures are you familiar with?

# 37) Name every data type.

# 38) What’s a foreign key?

# 39) When do validations get called?

# 40) What is eager loading?

# 41) What’s a partial? What’s it for, how many can you have?

# 42) What is HTTP?

# 43) Explain the asset pipeline.

# 44) How does false differ from nil?

# 45) What is Git and why would you use it?

# 46) What is a migration?

# 47) Explain the Rails request cycle.

# 48) Given 1GB of memory, and a billion phone numbers; how do you sort them?

# 49) Say you had an app with users. How would you let them have followers?

# 50) What is the default Rails server? What are some others.

# 51) What is the difference between a lambda, a block and a proc?
# 02_javascript.mdMarkdown
# 52) What are undefined and undeclared variables?

# 53) What is a closure, and how/why would you use one?

# 54) What's a typical use case for anonymous functions?

# 55) Can you explain how inheritance works in JavaScript?

# 56) When would you use document.write()?

# 57) Explain AJAX in as much detail as possible

# 58) Explain how JSONP works (and how it's not really AJAX)

# 59) Describe event bubbling.

# 60) What's the difference between an "attribute" and a "property"?

# 61) Difference between document load event and document ready event?

# 62) What is the difference between == and ===?

# 63) Explain how you would get a query string parameter from the browser window's URL.

# 64) Explain the same-origin policy with regards to JavaScript.

# 65) Explain event delegation.
# 03_html_css.mdMarkdown
# 66) What's a doctype?

# 67) Whats a css reset and what does it do?

# 68) Name some HTML5 elements

# 69) What is a css clearfix and how do you implement it?

# 70) Name some of the different ways to specify font-size in css.

# 71) How do you select the 3rd list-element in an unordered list with css?

# 72) What are data-attributes good for?

# 73) Describe the difference between cookies, sessionStorage and localStorage.