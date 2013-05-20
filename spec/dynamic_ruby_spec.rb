require "minitest/autorun"
require_relative "../lib/dynamic_ruby"

describe "dynamic scope" do
  it "should access dynamically declared variables" do
    result = nil
    testfun = lambda { dynamic[:name] }
    dynamic(name: "john") do
      result = testfun.call
    end
    result.must_equal "john"
    testfun.call.must_be_nil
  end

  it "should stack access to dynamically declare variables" do
    result = nil
    testfun = lambda { dynamic[:name] }
    dynamic(name: "right") do
      dynamic(name: "wrong") do

      end
      result = testfun.call
    end
    result.must_equal "right"
  end

  it "should respect thread local variables" do
    result = nil
    testfun = lambda { dynamic[:name] }
    thr = Thread.new do
      dynamic(name: "right") do
        sleep 0.1
        result = testfun.call
      end
    end

    Thread.new do
      dynamic(name: "wrong") do
        sleep 1
      end
    end
    thr.join
    result.must_equal "right"
  end
end
