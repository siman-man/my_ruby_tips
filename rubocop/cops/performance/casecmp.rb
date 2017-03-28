require 'benchmark/ips'

Benchmark.ips do |x|
  languages = %w(Ruby Python Java JavaScript Perl)

  x.report('#with downcase') do
    str = languages.sample
    str.downcase == 'ruby'
  end

  x.report('#with upcase') do
    str = languages.sample
    str.upcase == 'RUBY'
  end

  x.report('#casecmp') do
    languages.sample.casecmp('ruby').zero?
  end

  x.compare!
end
