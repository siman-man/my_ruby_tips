numbers = [*1..10]

# bad
sum = numbers.each_with_object(0) { |e, a| a += e }

# good
num = 0
sum = numbers.each_with_object(num) { |e, a| a += e }
