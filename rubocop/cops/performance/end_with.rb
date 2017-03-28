require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#=~') do
    'abc' =~ /bc\Z/
  end

  x.report('#end_with?') do
    'abc'.end_with?('bc')
  end

  x.compare!
end
