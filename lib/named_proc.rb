require_relative 'named_proc/version'

# Class for a proc that's got a name
class NamedProc < Proc
  attr_reader :name

  def initialize(name)
    @name = name
    super()
  end
  
  # Create a named proc from a given proc/lambda object
  def self.create(name, block, create_lambda = false)
    block = Module.new.send(:define_method, name.to_sym, &block) if create_lambda
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
  
  ::Object.send :include, NamedProc::Object
end
