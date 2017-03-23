begin
  y = rand(100)
  x = rand(100)
end while y == x

loop do
  y = rand(100)
  x = rand(100)
  break if y != x
end

puts [y, x]
