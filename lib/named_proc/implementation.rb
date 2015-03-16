# Class for a proc that's got a name
class NamedProc < Proc
  attr_reader :name

  def initialize(name)
    @name = name
    super()
  end

  def inspect
    super.sub /^#<#{self.class}/, "#<#{self.class}[#{name}]"
  end
  
  # Create a named proc from a given proc/lambda object
  def self.create(name, block, create_lambda = false)
    if create_lambda
      lambdafyer = Module.new
      lambdafyer.singleton_class.send(:define_method, :lambdafy, &block)
      block = lambdafyer.method(:lambdafy).to_proc
    end
    new(name.to_sym, &block)
  end
  
  # Proxy object to ease named proc initialization
  module Proxy
    Proc = BasicObject.new
    def Proc.method_missing(name, &block)   NamedProc.create(name, block) end

    Lambda = BasicObject.new
    def Lambda.method_missing(name, &block) NamedProc.create(name, block, true) end
  end
  
  # Mixing in low level method "links"
  module Object
    private
  
    # Create a proc with name if given
    def proc
      if block_given?
        super
      else
        NamedProc::Proxy::Proc
      end
    end
    
    # Same for lambda
    def lambda
      if block_given?
        super
      else
        NamedProc::Proxy::Lambda
      end
    end
  end
end
