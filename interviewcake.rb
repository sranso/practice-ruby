require 'debugger'
class Array

  def my_reverse
    (0..self.length/2 - 1).each do |index|
      self[index], self[-index - 1] = self[-index - 1], self[index]
    end
    self
  end

end

class Stack
  attr_reader :history, :largest

  def initialize(num)
    @history = [num]
    @largest = [num]
  end

  def add(num)
    history << num
    set_largest
  end

  def remove
    removed = history.pop
    if removed == largest.last
      largest.pop
    end
  end

  def top
    history.last
  end

  def set_largest
    if top >= largest.last
      largest << top
    end
  end

  def get_largest
    largest.last
  end

end

class Queue
  attr_reader :reading
  attr_writer :writing
  attr_accessor :bothing

  def initialize
    @reading = 'read'
    @writing = 'write'
    @bothing = 'both'
  end

  def what
    puts reading
    puts bothing
    puts @writing
  end

  def write
    reading = 'read it'
    writing = 'write it'
    bothing = 'both it'
  end

  def write_forril
    @reading = 'read it'
    self.writing = 'write it'
    self.bothing = 'both it'
  end


end

q = Queue.new
q.write_forril
q.what


