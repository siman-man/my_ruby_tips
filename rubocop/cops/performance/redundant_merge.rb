require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#merge!') do
    hash = { a: 1, b: 2, c: 3 }
    hash.merge!(d: 4, e: 5, f: 6)
  end

  x.report('#[]=') do
    hash = { a: 1, b: 2, c: 3 }
    hash[:d] = 4
    hash[:f] = 5
    hash[:e] = 6
  end

  x.compare!
end
