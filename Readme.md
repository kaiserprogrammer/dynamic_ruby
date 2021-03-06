# Dynamic Scope for Ruby
[![Build Status](https://secure.travis-ci.org/kaiserprogrammer/dynamic_ruby.png)](http://travis-ci.org/kaiserprogrammer/dynamic_ruby)

## Setting Scope
```ruby
dynamic[:name] # => :unbound_variable_name

dynamic name: "first" do
  # already bound here
  dynamic[:name] # => "first"
  dynamic name: "second" do
    dynamic[:name] # => "second"
  end
  dynamic[:name] # => "first"
end

dynamic[:name] # => :unbound_variable_name
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

## Default arguments in Methods

```ruby
def user(id=dynamic[:user_id])
  puts id
end

dynamic user_id: 1 do
  user
  dynamic user_id: 2 do
    user
  end
end
```

## Context Dependent Execution

```ruby
fun = lambda { puts dynamic[:db] }

dynamic db: "german_db" do
  fun.()
end

dynamic db: "france_db" do
  fun.()
end
```
