require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#map -> flatten') do
    [1, 2, 3, 4].map { |e| [e, e] }.flatten(1)
  end

  x.report('#flat_map') do
    [1, 2, 3, 4].flat_map { |e| [e, e] }
  end

  x.compare!
end
