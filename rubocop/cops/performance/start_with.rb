require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#=~') do
    'abc' =~ /\Abc/
  end

  x.report('#start_with?') do
    'abc'.start_with?('ab')
  end

  x.compare!
end
