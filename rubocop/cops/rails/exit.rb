def proc_exit
  puts "proc_exit"
  exit
rescue SystemExit
  puts "rescued a SystemExit exception"
end

def proc_exit!
  puts "proc_exit!"
  exit!
rescue SystemExit
  puts "rescued a SystemExit exception"
end

proc_exit
proc_exit!
