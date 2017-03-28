require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#count') do
    [1, 2, 3].count
  end

  x.report('#size') do
    [1, 2, 3].size
  end

  x.compare!
end
