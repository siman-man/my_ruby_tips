## Hash

### [recursive hash](https://github.com/siman-man/my_ruby_tips/blob/master/hash/recursive_hash.rb)

```ruby
rh = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }

p rh[:a]          #=> {}
p rh[:a][:b]      #=> {}
p rh[:a][:b][:c]  #=> {}
```
