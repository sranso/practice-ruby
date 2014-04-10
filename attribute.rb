require 'debugger'

class Attribute
  attr_reader   :reader
  attr_writer   :writer
  attr_accessor :both

  def initialize
    @reader = 'attr reader'
    @writer = 'attr writer'
    @both   = 'attr accessor'
    local = 'local'
    # if we said 'puts local' here, we'd get 'local'
  end

  def read
    puts reader
    puts @writer
    puts both
    # puts local
    #=> undefined local variable or method `local' for #<Attribute:0x007fdea1a8af20> (NameError)
    # puts self.local
    #=> undefined method `local' for #<Attribute:0x007fc60418ef80> (NoMethodError)
    # puts @local
    #=> @local is nil!
  end

  def write
    debugger
    # self.reader = 'read it'
    #=> undefined method `reader=' for #<Attribute:0x007fb45b24eed0> (NoMethodError)
    @reader     = 'read it'
    self.writer = 'write it' # interpreter cant tell if want to create local var or a method. that's why you write self. otherwise it's not specific enough.
    self.both   = 'both it'
  end
end

attribute = Attribute.new
attribute.read
attribute.write
attribute.read

