require 'benchmark/ips'
require 'date'

BEGIN_OF_JULY = Date.new(2015, 7, 1)
END_OF_JULY = Date.new(2015, 7, 31)
DAY_IN_JULY = Date.new(2015, 7, 15)

Benchmark.ips do |x|

  x.report('range#include?') do
    (BEGIN_OF_JULY..END_OF_JULY).include?(DAY_IN_JULY)
  end

  x.report('range#cover?') do
    (BEGIN_OF_JULY..END_OF_JULY).cover?(DAY_IN_JULY)
  end

  x.compare!
end
