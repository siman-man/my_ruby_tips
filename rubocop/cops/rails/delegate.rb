# bad
def bar
  foo.bar
end

# good
delegate :bar, to: :foo
