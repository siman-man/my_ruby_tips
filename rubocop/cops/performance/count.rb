require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#select -> size') do
    [1, 2, 3, 4, 5].select { |e| e > 2 }.size
  end

  x.report('#count') do
    [1, 2, 3, 4, 5].count { |e| e > 2 }
  end

  x.compare!
end
