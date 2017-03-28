require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#reverse -> each') do
    [*1..1000000].reverse.each do |i|
      i ** 2
    end
  end

  x.report('#reverse_each') do
    [*1..1000000].reverse_each do |i|
      i ** 2
    end
  end

  x.compare!
end
