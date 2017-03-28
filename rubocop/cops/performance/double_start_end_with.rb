require 'benchmark/ips'

Benchmark.ips do |x|
  str = 'str'

  x.report('#double start_with?') do
    str.start_with?('a', 'b') || str.start_with?('c')
  end

  x.report('#single start_with?') do
    str.start_with?('a', 'b', 'c')
  end

  x.compare!
end
