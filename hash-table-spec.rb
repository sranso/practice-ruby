require './hash-table'

describe MyHash do
  stubbed_hash = MyHash.new
  describe '#assign_or_find_index' do
    it 'should return a number between 0 and 100' do
      expect(stubbed_hash.assign_or_find_index(:test_key)).to be_between(0, 100)
    end
  end
end