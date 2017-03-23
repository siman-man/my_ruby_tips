# bad
do_something do |used, _unused|
  puts used
end

# good
do_something do |used, unused|
  puts used
end
