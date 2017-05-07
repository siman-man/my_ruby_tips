## Rakefile

### create task

```ruby
task :foo do
  puts 'foo =>'
end
```


### pre-task

```ruby
task :task_before do
  puts "before =>"
end

task foo: [:task_before] do
  puts "foo =>"
end
```
