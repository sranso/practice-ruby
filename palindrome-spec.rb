require './palindrome'

describe '#find_smallest' do
  it "should return the smallest int in an array" do
    expect(find_smallest([22, 52, 66, 82, 5, 8, 12, 19])).to eq(5)
  end
  it "should return the smallest int in an array" do
    expect(find_smallest([1, 3, 5, 9, 100])).to eq(1)
  end
  it "should return the smallest int in an array" do
    expect(find_smallest([100, 33, 11, 9])).to eq(9)
  end
end

describe '#next_palindrome' do
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(121)).to eq(131)
  end
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(1221)).to eq(1331)
  end
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(1991)).to eq(2002)
  end
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(2199912)).to eq(2200022)
  end
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(2129212)).to eq(2130312)
  end
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(999)).to eq(1001)
  end
  it "should return the next smallest number that is greater than the given number which is a palindrome" do
    expect(next_palindrome(99)).to eq(101)
  end
end

describe '#least_common_multiple' do
  it "should return the LCM" do
    expect(least_common_multiple(2,3,4)).to eq(12)
  end
  it "should return the LCM" do
    expect(least_common_multiple(10,3,6)).to eq(30)
  end
  it "should return the LCM" do
    expect(least_common_multiple(4,5,6)).to eq(60)
  end
end

describe '#reverse_string' do
  it "should reverse a string" do
    expect(reverse_string("Hi my name is Bob")).to eq("iH ym eman si boB")
  end
end

