require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#fixed_size') do
    'hoge'.size
  end

  x.report('#literal') do
    4
  end

  x.compare!
end
