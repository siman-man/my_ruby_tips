require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#gsub') do
    'abc'.gsub('a', '')
  end

  x.report('#delete') do
    'abc'.delete('a')
  end

  x.compare!
end
