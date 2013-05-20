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
    block.call
    bindings.each do |name, val|
      if defined[name]
        Thread.current[name] = defined[name]
      else
        Thread.current[name] = nil
      end
    end
  end
end

def test(name = dynamic[:name])
  p name
end

if __FILE__ == $PROGRAM_NAME
  dynamic(name: "jim") do
    test
    dynamic(name: "john") do
      test
    end
    test
  end
  test("huan")
end
