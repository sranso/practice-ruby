require 'debugger'
# ==================
class Array

  def my_reverse
    (0..self.length/2 - 1).each do |index|
      self[index], self[-index - 1] = self[-index - 1], self[index]
    end
    self
  end

end
# ==================
class Stack
  attr_reader :largest
  attr_accessor :history

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
# ==================
class Queue
  attr_accessor :stack1, :stack2

  def initialize(num)
    @stack1 = Stack.new(num)
    @stack2 = Stack.new(nil)
  end

  def enqueue(num)
    self.stack1.add(num)
    return stack1.top
  end

  def dequeue
    if self.stack2.history == [nil]
      @stack2 = Stack.new(stack1.top)
      self.stack2.history = Array.new(stack1.history.length)
    end
    (0..(self.stack1.history.length - 1)).each do |index|
      self.stack1.history[index], self.stack2.history[-index - 1] = self.stack2.history[-index - 1], self.stack1.history[index]
    end
    self.stack1, self.stack2 = self.stack2, self.stack1
    return self.stack1.top
  end
end


