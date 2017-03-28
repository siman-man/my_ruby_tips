require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#shuffle.first') do
    [1, 2, 3].shuffle.first
  end

  x.report('#sample') do
    [1, 2, 3].sample
  end

  x.compare!
end
