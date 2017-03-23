result = (1..4).reduce(0) do |acc, i|
  next if i.odd?
  acc + i
end
