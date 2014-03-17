require './ruby'

describe '#find_smallest' do
  it "should return the smallest int in an array" do
    expect(find_smallest([22, 52, 66, 82, 5, 8, 12, 19])).to eq(5)
  end

  it "should return the smallest int in an array" do
    expect(find_smallest([2, 52, 66, 82, 5, 8, 12, 1])).to eq(1)
  end
end

describe '#next_palendrome' do
  it "should return the next smallest number that is greater than the given number which is a palendrome" do
    expect(next_palendrome(121)).to eq(131)
  end
  it "should return the next smallest number that is greater than the given number which is a palendrome" do
    expect(next_palendrome(1221)).to eq(1331)
  end
  it "should return the next smallest number that is greater than the given number which is a palendrome" do
    expect(next_palendrome(1991)).to eq(2002)
  end
  it "should return the next smallest number that is greater than the given number which is a palendrome" do
    expect(next_palendrome(2199912)).to eq(2200022)
  end
end