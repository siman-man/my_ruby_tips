## Enumerator

### sorted?

```ruby
module Enumerable
  def sorted?
    each_cons(2).all? {|a, b| (a <=> b) <= 0 }
  end

  def sorted_by?
    each_cons(2).all? {|a, b| (yield(a) <=> yield(b)) <= 0 }
  end
end
```
