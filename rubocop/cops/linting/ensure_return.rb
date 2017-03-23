def message
  raise
ensure
  return 'error!!'
end

begin
  val = message
  puts val
rescue => ex
  puts 'OMG!!'
end
