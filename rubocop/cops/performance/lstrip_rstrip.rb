require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#lstrip.rstrip') do
    'abc'.lstrip.rstrip
  end

  x.report('#strip') do
    'abc'.strip
  end

  x.compare!
end
