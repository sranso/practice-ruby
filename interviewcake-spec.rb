require './interviewcake'

describe 'Array' do
  describe '#my_reverse' do
    it 'should take an array of characters and reverse them' do
      expect(["s", "a", "r", "a", "h"].my_reverse).to eq(["h", "a", "r", "a", "s"])
    end
    it 'should take an array of characters and reverse them' do
      expect(["s", "a", "r", "a"].my_reverse).to eq(["a", "r", "a", "s"])
    end
  end
end