trace_var(:$v) do |val|
  bl = caller_locations.first
  p [bl.path, bl.lineno, val]
end

a = 3
$v = 1
b = 2
$v = "foo"
