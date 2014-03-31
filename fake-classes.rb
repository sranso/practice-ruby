class FakeArray

  def initialize
    @info = ["puppies", "kittens", "baby sloths", "puppies"]
  end

  def each
    @info.each do |element|
      yield element if block_given?
    end
  end

  def first
    @info[0]
  end

  def compact
    new_array = []
    @info.each do |element|
      new_array << element unless new_array.include? element
    end
    new_array
  end

end

fa = FakeArray.new
fa.compact