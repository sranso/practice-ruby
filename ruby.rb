# https://gist.github.com/robertjwhitney/bc68fa071606ba6fd3b8

require 'debugger'
# 1) Given a circular list of integers (when you reach the end of the list you come back to the beginning), what is the most efficient algorithm to find the smallest integer in the list?

# For example: 
# circular_list = [22, 52, 66, 82, 5, 8, 12, 19]
  # go through each item in array, set it equal to var if it's smaller than the previous one
  # OR go through each item in the array until the current number is less than the previous number. at that point, you've reached the smallest item in the array
  # OR just return the minimum...? is that 'cheating'?

  def find_smallest(list)
    return list.min
  end

# 2) Write a function that takes an integer and returns the smallest number that is greater than the given number which is a palendrome.

# For example, if the input was 111 the next palindromic number would be 121.
  # if number is odd number of digits, find the middle int and increase it by one
  # if number is even number of digits, find middle two ints and increase by one
  # if the middle int is 9, then increase the ints to its left and right by one and make the middle int zero.
  # if outer ints are 9 and inner int is 9, 
  
  def next_palindrome(palindrome)
    palindrome_string = palindrome.to_s
    # change middle digit for palindromes with odd number of digits
    if palindrome_string.length.odd?
      middle = palindrome_string.length / 2
      if palindrome_string[middle] == "9"
        palindrome_string[middle] = "0"
        middle_two = middle - 1, middle + 1
      else
        palindrome_string[middle] = palindrome_string[middle].to_i.next.to_s
        return palindrome_string.to_i
      end
    else
      middle_two = palindrome_string.length / 2 - 1, palindrome_string.length / 2
    end
    # address all digits with 9
    while palindrome_string[middle_two[0]].include? "9"
      palindrome_string[middle_two[0]] = "0"
      palindrome_string[middle_two[1]] = "0"
      middle_two = middle_two[0] - 1, middle_two[1] + 1
      palindrome_string.to_i
    end
    # if palindrome_string is all 0's
    if palindrome_string.to_i == 0
      return ("1" + palindrome_string[0..-2] + "1").to_i
    end
    # update outside digits
    palindrome_string[middle_two[0]] = palindrome_string[middle_two[0]].to_i.next.to_s
    palindrome_string[middle_two[1]] = palindrome_string[middle_two[1]].to_i.next.to_s
    return palindrome_string.to_i
  end
  
# 3) The least common multiple of a set of integers is the smallest positive integer that is a multiple of all of the integers in the set.

# Write a function that takes an array of integers and efficiently calculates and returns the LCM.
  # find smallest multiple, and call smallest^n until that result is divisible by all the other multiples
def least_common_multiple(*multiples) 
  lcm = multiples.max
  while !divisible?(lcm, multiples)
    factor = 1
    multiples.each do |first_multiple|
      multiples.each do |second_multiple|
        lcm = first_multiple * second_multiple * factor
        return lcm if divisible?(lcm, multiples)
      end
      factor += 1
    end
  end
end

def divisible?(lcm, *multiples)
  multiples[0].each do |multiple|
    return false if lcm % multiple != 0
  end
  return true
end

# 4) Explain the difference between a symbol and a string.
  # :symbol vs "string"
  # strings are mutable, symbols are not. that said, ruby interpreter never knows what that string may hold in terms of data. so, every string needs to have its own place in memory, and if it's not stored in a variable, ruby interpreter knows that it wont be used again, and marks it for destruction. symbols on the other hand do not need to have more than one place in memory, and are not marked for destruction. this makes them more "efficient" space-wise and easier to find.
  # http://www.robertsosinski.com/2009/01/11/the-difference-between-ruby-symbols-and-strings/

# 5) What is the purpose of yield
  # yield passes control from one method to another, basically saying 'go do this thing, and come back when you're done'.
  # def example
  #   puts 'in the method'
  #   yield(1)
  #   puts 'back in the method'
  #   yield(2)
  # end
  # example { |i| puts 'in the block #{i}' }

# 6) What is a Range?
  # represents an interval, set of values w/ a start and end.
  # ex: (1..6) is [1,2,3,4,5,6]

# 7) What is the difference between ‘&&’, ‘and’ and ‘&’ operators?
  # && - boolean operator, the logical and. requires both things on left and right to be true
  # and - useful for chaining related operations together until one returns nil or false. same as && but with lower precedence.
  # & - binary AND operator, but only defined on FalseClass, NilClass, and TrueClass.

# 8) What is a module?
  # collection of classes, methods, and constants. two major benefits: 1. provide a namespace and prevent name clashes, 2. implement the mixin facility

# 9) How can you define a custom Exception?
  # def no_lies(what_you_said)
  #   raise TypeError, 'you told a lie!' if what_you_said == false
  # end

# 10) What do controllers do in Rails?
  # controllers are where objects are created so that they can be passed to views, and ultimately shown to the user. they are like 'middle men' between models and views.

# 11) What is RESTful routing?
  # a style of route construction that makes logical sense given the resources. typical restful routing looks like so, given the resource "pictures":
    # GET /pictures => index, display all pictures
    # GET /pictures/new => new, form to create new picture
    # POST /pictures => create, create new picture
    # GET /pictures/:id => show, show specific picture
    # GET /pictures/:id/edit => edit, form to edit picture
    # PATCH/PUT /pictures/:id => update, update picture
    # DELETE /pictures/:id => delete, delete picture

# 12) What is the purpose of a layout?
  # the layout is helpful for creating DRY code. the layout sets up the basics for any view (doctype, html, scripts, etc), and then in its body, renders the different, more specific views.

# 13) What is Rake?
  # an internal domain specific language (dsl) programmed in ruby.

# 14) What is Capistrano?
  # http://capistranorb.com/
  # remote server automation and deployment tool written in ruby. extends the Rake dsl with methods specific to running commands on() servers

# 15) How do you create a has many through relationship?
  # create three tables and models, say Pyhsician Appointment and Patient. the models, they could look like so:
  # class Physician < ActiveRecord::Base
  #   has_many :appointments
  #   has_many :patients, through: :appointments
  # end

  # class Appointment < ActiveRecord::Base
  #   belongs_to :patient
  #   belongs_to :physician
  # end

  # class Patient < ActiveRecord::Base
  #   has_many :appointments
  #   has_many :physician, through: :appointments
  # end


# 16) What is fields_for used for?
  # creates a scope around a specific model object. similar to form_for in that it yields a FormBuilder object associated w/ a particular model object to a block. 
  # fields_for(record_name, record_object = nil, options = {}, &block)

# 17) What is interpolation?
  # allows ruby code to appear w/in a string

# 18) Reverse the string "question" in place.
  # "question".reverse 

# 19) Explain the difference between class and instance variables
  # @@class variable is accessible on the class level of a method. @instance variables are accessible only to instances of the class.

# 20) What is a mixin? What is the difference compared with classical inheritance?
  # modules eliminate the need for multiple inheritence, providing a facility called a mixin. mixins provide a controlled way to add functionality to classes. for ex, one class can inherit methods from two different modules.

# 21) Write a method that turns the string "Hi my name is Bob" into "iH ym eman si boB"
  def reverse_string(string)
    string.split(" ").map do |word|
      word.reverse
    end.join(" ")
  end

# 22) Explain "convention over configuration."
  # software design paradigm, seeks to decrease the number of decisions that developers need to make. makes a program simple w/o losing flexibility.

# 23) What is ORM?
  # object relational mapping. basically it's the way an application can access information in the database. an example of an ORM is activerecord.

# 24) What is a session?
  # sessions save data across multiple requests, keep track of a certain state of a particular user.
  # consists of a hash of values and a session id.
  # http://guides.rubyonrails.org/security.html#what-are-sessions-questionmark

# 25) What is a namespace?
  # container for a set of identifiers. it allows a user to distinguish one var / instance / class / obj from another, and understand what it 'contains'

# 26) What’s the difference between authorization and authentication?
  # authorization - verifies what you are authorized to do
  # authentication - verifies who you are
  # http://www.cyberciti.biz/faq/authentication-vs-authorization/

# 27) Explain this ruby idiom: y ||= z
  # if y doesn't exist, set it equal to z. if y already exists, do nothing.

# 28) What does self mean?
  # refers to the object that the method is being called upon. gives you access to the current object.

# 29) Give me an example of recursion.
  # def recursion(num)
  #   num = num + 2
  #   return true if num > 6
  #   recursion(num)
  # end

# 30) How do redirect and render differ?
  # redirect sends a request to another view. render shows a particular view

# 31) Explain what ‘has_many’ is and what happens when it is run.
  # specifies a one-to-many association. for example, a farmer has many pigs (and often implied, a pig belongs_to a farmer).

# 32) What’s the difference between PUT and POST?
  # both are used for creating. post is used to modify and update a resource. put is used to create a resource or overwrite it.

# 33) Explain why in ruby nil.object_id is equal to 4.
  # nil is an object created when the language initializes, and that object's id happens to always be 4
  # (although when i run this in irb, i get 8??)
 # 2.0.0-p353 :044 > nil.object_id
 # => 8

# 34) How would I revert to a previous commit?
  # git checkout commit_id

# 35) What are different types of joins in SQL?
  # inner join - returns all rows when there is at least one match in both tables
  # left join - returns all rows from the left table,a nd the matched rows from the right table
  # right join - returns all rows from the right table, and the matched rows from the left table
  # full join - returns all rows when there is a match in one of the tables

# 36) What data structures are you familiar with?
  # hashes, arrays, tries, binary lists, object

# 37) Name every data type.
  # constants, symbols, hashes, arrays, strings, numbers (ints and floats)

# 38) What’s a foreign key?
  # an id that references another object, points to the primary key in another table

# 39) When do validations get called?
  # validations are run before an object gets sent to the db (e.g. SQL INSERT and SQL UPDATE).

# 40) What is eager loading?
  # the mechanism for loading the associated records of the objects returned by model using as few queries possible.
    # clients = Client.limit(10)
    # clients.each do |client|
    #   puts client.address.postcode
    # end
    # => 11 queries, vs
    # clients = Client.includes(:address).limit(10)
    # clients.each do |client|
    #   puts client.address.postcode
    # end
    # => 2 queries


# 41) What’s a partial? What’s it for, how many can you have?
  # a way to break down the rendering process into more manageable chunks. for ex, if you want to display a form on a page, you could have the new.html file which renders _form.html partial

# 42) What is HTTP?
  # hypertext transfer protocol. for ex, a client submits an http request message to the server, and the server provides resources such as html files, and returns a response to the client.

# 43) Explain the asset pipeline.
  # provides a framework to concatenate and minify or compress javascript and css assets. also allows these assets to be written in other languages like coffeescript, sass, erb.

# 44) How does false differ from nil?
  # every expression in ruby evaluates to an object, and every object has a boolean value. most ruby objects have the boolean value of true, and the only two objects that have a boolean value of false are false and nil objects.
  # nil can be converted to an int (0) and false cannot.
  # nil is returned with something does not occur, false is returned when something is wrong.

# 45) What is Git and why would you use it?
  # git is version control. people use it to keep track of changes made to a project, features added, etc. it's helpful when there are mutliple people working on a project.
  # git is not github. github is a remote repository that holds commits from a git repository.

# 46) What is a migration?
  # a migration is a set of commands that create and destroy tables in the database. allow you to alter the database schema over time in a consistent and easy way.

# 47) Explain the Rails request cycle.
  # client sends a request to the server. rails checks to see if the qualifications for that request exist (looks in routes.rb, checks if the route (e.g. cnn.com) exists with that kind of request (e.g. GET)). if this passes, the route points the request to a controller, where the resources for the view are retrieved from the db (e.g. @stories = Stories.all). the request then heads to the server, evaluates the view into a string, and sends it back to the client, renders it on their browser.

# 48) Given 1GB of memory, and a billion phone numbers; how do you sort them?
  # probably in a trie.

# 49) Say you had an app with users. How would you let them have followers?
  # http://stackoverflow.com/questions/10807900/how-to-store-bidirectional-relationships-in-a-rdbms-like-mysql
  # one of two ways..
  # 1. create a table with both directions stored. for ex...
    # user   follower
    # 1      2
    # 2      1
  # 2. create table with only one direction stored in the db. for ex...
    # user   follower
    # 1      2
    # 1      3

# 50) What is the default Rails server? What are some others.
  # localhost:3000. sinatra is on 9393 using shotgun. python is on 8000. you can also define your own server on rails using rails s -p 3001 (will start a server on port 3001).
  
# 51) What is the difference between a lambda, a block and a proc?
# 02_javascript.mdMarkdown
  # 
  
# 52) What are undefined and undeclared variables?
  # 
  
# 53) What is a closure, and how/why would you use one?
  # 
  
# 54) What's a typical use case for anonymous functions?
  # 
  
# 55) Can you explain how inheritance works in JavaScript?
  # 
  
# 56) When would you use document.write()?
  # 
  
# 57) Explain AJAX in as much detail as possible
  # 
  
# 58) Explain how JSONP works (and how it's not really AJAX)
  # 
  
# 59) Describe event bubbling.
  # 
  
# 60) What's the difference between an "attribute" and a "property"?
  # 
  
# 61) Difference between document load event and document ready event?
  # 
  
# 62) What is the difference between == and ===?
  # 
  
# 63) Explain how you would get a query string parameter from the browser window's URL.
  # 
  
# 64) Explain the same-origin policy with regards to JavaScript.
  # 
  
# 65) Explain event delegation.
# 03_html_css.mdMarkdown
  # 
  
# 66) What's a doctype?
  # 
  
# 67) Whats a css reset and what does it do?
  # 
  
# 68) Name some HTML5 elements
  # 
  
# 69) What is a css clearfix and how do you implement it?
  # 
  
# 70) Name some of the different ways to specify font-size in css.
  # 
  
# 71) How do you select the 3rd list-element in an unordered list with css?
  # 
  
# 72) What are data-attributes good for?
  # 
  
# 73) Describe the difference between cookies, sessionStorage and localStorage.
  # 
