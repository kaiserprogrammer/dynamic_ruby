# Dynamic Scope for Ruby
[![Build Status](https://secure.travis-ci.org/kaiserprogrammer/dynamic_ruby.png)](http://travis-ci.org/kaiserprogrammer/dynamic_ruby)

## Setting Scope
```ruby
# nothing set
dynamic name: "first" do
  # it's set here
  dynamic[:name] # => "first"
  dynamic name: "second" do
    dynamic[:name] # => "second"
  end
  dynamic[:name] # => "first"
end
# nothing set again

# no longer set here anymore
```

## Multiple Variables
```ruby
  dynamic name: "jim", age: 32 do
    dynamic(name: "john") do
      dynamic[:name]
      dynamic[:age]
    end
  end
```
