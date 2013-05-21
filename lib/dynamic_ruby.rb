def dynamic(bindings={}, &block)
  if !block_given?
    Thread.current
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
          Thread.current[name] = nil
        end
      end
    end
  end
end
