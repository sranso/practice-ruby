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


