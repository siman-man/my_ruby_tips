require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('#times.map') do
    9.times.map do |i|
      i.to_s
    end
  end

  x.report('#Array.new(n)') do
    Array.new(9) do |i|
      i.to_s
    end
  end
  
  x.compare!
end
