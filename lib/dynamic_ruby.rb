class DynamicLookup
  def [](name)
    val = Thread.current[name]
    val ? val : ("unbound_variable_" + name.to_s).to_sym
  end
end

DYNAMIC_LOOKUP = DynamicLookup.new

def dynamic(bindings={}, &block)
  if !block_given?
    DYNAMIC_LOOKUP
  else
    defined = {}
    bindings.each do |name, val|
      if Thread.current[name]
        defined[name] = Thread.current[name]
      end
      Thread.current[name] = val
    end
    begin
      block.call
    ensure
      bindings.each do |name, val|
        if defined[name]
          Thread.current[name] = defined[name]
        else
          Thread.current[name] = ("unbound_variable_" + name.to_s).to_sym
        end
      end
    end
  end
end
