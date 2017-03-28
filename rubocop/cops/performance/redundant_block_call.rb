require 'benchmark/ips'

Benchmark.ips do |x|
  def method(&block)
    block.call(100)
  end

  def another
    yield(100)
  end

  x.report('#pass block') do
    method { |i| i.to_s }
  end

  x.report('#yield') do
    another { |i| i.to_s }
  end

  x.compare!
end
