# bad
def some_method
  some_num * 10
  do_something
end

def some_method
  some_var
  do_something
end

# good
def some_method
  do_something
  some_num * 10
end

def some_method
  do_something
  some_var
end
