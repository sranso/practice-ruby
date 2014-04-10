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

describe 'Stack' do
  describe '#get_largest' do
    stack = Stack.new(0)
    stack.add(3)
    stack.add(2)
    stack.add(4)
    stack.add(1)
    it 'should return the largest element in the stack' do
      expect(stack.get_largest).to eq 4
    end
    it 'should return the largest element in the stack even when something is removed' do
      stack.remove
      stack.remove
      expect(stack.get_largest).to eq 3
    end
  end
end

describe 'Queue' do
  queue = Queue.new(1)
  describe '#enqueue' do
    it 'should add something to the queue' do
      expect(queue.enqueue(5)).to eq 5
    end
  end

  queue.enqueue(4)
  queue.enqueue(14)
  describe '#dequeue' do
    it 'should remove the oldest thing from the queue' do
      expect(queue.dequeue).to eq 1
    end
    it 'should remove the oldest thing from the queue' do
      expect(queue.dequeue).to eq 5
    end
  end

end



