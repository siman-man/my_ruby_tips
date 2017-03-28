require 'benchmark/ips'

Benchmark.ips do |x|
  array = [*1..100]

  x.report('# splat first') do
    case rand(6)
    when *array
      'nope..'
    when 0
      'hit!'
    end
  end

  x.report('# splat last') do
    case rand(6)
    when 0
      'hit!'
    when *array
      'nope..'
    end
  end

  x.compare!
end
