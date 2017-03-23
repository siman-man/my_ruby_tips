def some_method(val)
  p val
end

def a
  yield(3)
end

some_method a { |val| puts val; val }
