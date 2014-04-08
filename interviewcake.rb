class Array

  def my_reverse
    (0..self.length/2 - 1).each do |index|
      self[index], self[-index - 1] = self[-index - 1], self[index]
    end
    self
  end

end
