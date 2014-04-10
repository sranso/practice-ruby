require './attribute'

describe Attribute do
  test = Attribute.new

  describe '#initialize' do
    it 'should create the reader attribute' do
      expect(test.reader).to eq "attr reader"
    end
    it 'should create the writer attribute' do
      expect{test.writer}.to raise_error
    end
    it 'should create the accessor attribute' do
      expect(test.both).to eq "attr accessor"
    end
    it 'should create a local neither variable' do
      expect{test.local}.to raise_error
    end
  end

  describe '#read' do
    it 'should puts the value of reader' do
      expect(test.read).to puts "attr reader"
    end
    it 'should puts the value of writer' do

    end
    it 'should puts the value of both' do

    end
  end
  describe '#write' do
    it 'should' do

    end
  end
  describe '#reader' do
    it 'should' do

    end
  end
  describe '#writer' do
    it 'should' do

    end
  end
  describe '#both' do
    it 'should' do

    end
  end
end