require 'benchmark/ips'

Benchmark.ips do |x|
  nums = Array.new(10000) { rand(10000) }

  x.report('#with block') do
    nums.sort { |a, b| a.to_s <=> b.to_s }
  end

  x.report('#to_proc') do
    nums.sort_by(&:to_s)
  end

  x.compare!
end
