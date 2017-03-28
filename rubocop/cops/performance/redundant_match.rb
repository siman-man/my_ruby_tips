require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#match') do
    'abc'.match(/abc/)
  end

  x.report('#match?') do
    'abc'.match?(/abc/)
  end

  x.report('#=~') do
    'abc' =~ /abc/
  end

  x.compare!
end
