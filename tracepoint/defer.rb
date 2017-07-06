$defer_stack = Hash.new {|h, k| h[k] = [] }

module Kernel
  def defer(&block)
    b = caller_locations[0]
    key = "#{self.class}::#{b.base_label}"
    $defer_stack[key] << block
  end
end

TracePoint.trace(:return) do |tp|
  next if tp.method_id == :defer

  key = "#{tp.defined_class}::#{tp.method_id}"

  while block = $defer_stack[key].pop
    block.call
  end
end

def hello
  defer { puts "world" }
  defer { puts "second" }

  puts "hello"
end

def count
  puts "counting"

  1.upto(10) do |i|
    defer { puts i }
  end

  puts "done"
end

hello
count
