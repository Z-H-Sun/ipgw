fail "Use Ruby 1.1" if VERSION < "1.1"

module Exception2MessageMapper
  @RCS_ID='-$Id: e2mmap.rb,v 1.10 1999/02/17 12:33:17 keiju Exp keiju $-'

  E2MM = Exception2MessageMapper

  def E2MM.extend_object(cl)
    super
    cl.bind(self) unless cl == E2MM
  end
  
  def E2MM.extend_to(b)
    c = eval("self", b)
    c.extend(self)
  end

  def bind(cl)
    self.module_eval %[
      def Raise(err = nil, *rest)
	Exception2MessageMapper.Raise(self.class, err, *rest)
      end
      alias Fail Raise

      def self.included(mod)
	mod.extend Exception2MessageMapper
      end
    ]
  end

  def Raise(err = nil, *rest)
    E2MM.Raise(self, err, *rest)
  end
  alias Fail Raise

  alias fail! fail
  def fail(err = nil, *rest)
    begin 
      E2MM.Fail(self, err, *rest)
    rescue E2MM::ErrNotRegisteredException
      super
    end
  end
  class << self
    public :fail
  end

  def def_e2message(c, m)
    E2MM.def_e2message(self, c, m)
  end
  
  def def_exception(n, m, s = StandardError)
    E2MM.def_exception(self, n, m, s)
  end

  @MessageMap = {}

  def E2MM.def_e2message(k, c, m)
    E2MM.instance_eval{@MessageMap[[k, c]] = m}
    c
  end
  
  def E2MM.def_exception(k, n, m, s = StandardError)
    n = n.id2name if n.kind_of?(Fixnum)
    e = Class.new(s)
    E2MM.instance_eval{@MessageMap[[k, e]] = m}
    k.const_set(n, e)
  end

  #
  def E2MM.Raise(klass = E2MM, err = nil, *rest)
    if form = e2mm_message(klass, err)
      $! = err.new(sprintf(form, *rest))
      $@ = caller(1) if $@.nil?
      $@.shift if $@[0] =~ /^#{Regexp.quote(__FILE__)}:/
      raise
    else
      E2MM.Fail E2MM, ErrNotRegisteredException, err.inspect
    end
  end
  class <<E2MM
    alias Fail Raise
  end

  def E2MM.e2mm_message(klass, exp)
    for c in klass.ancestors
      if mes = @MessageMap[[c,exp]]
        m = klass.instance_eval('"' + mes + '"')
        return m
      end
    end
    nil
  end
  class <<self
    alias message e2mm_message
  end

  E2MM.def_exception(E2MM, 
		     :ErrNotRegisteredException, 
		     "not registerd exception(%s)")
end
