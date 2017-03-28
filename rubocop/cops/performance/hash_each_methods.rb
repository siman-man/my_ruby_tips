require 'benchmark/ips'

Benchmark.ips do |x|
  hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

  x.report('#keys -> each') do
    hash.keys.each { |k| k.to_s }
  end

  x.report('#each_key') do
    hash.each_key { |k| k.to_s }
  end

  x.compare!
end
