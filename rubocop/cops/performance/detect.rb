require 'benchmark/ips'

Benchmark.ips do |x|
  nums = [*1..100]

  x.report('#select -> first') do
    nums.select { |i| i % 15 == 0 }.first
  end

  x.report('#detect') do
    nums.detect { |i| i % 15 == 0 }
  end

  x.compare!
end
