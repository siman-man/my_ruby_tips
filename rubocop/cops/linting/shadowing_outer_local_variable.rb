# bad
def some_method
  foo = 1

  2.times do |foo| # shadowing outer `foo`
    rand(foo)
  end

  p foo
end

some_method
