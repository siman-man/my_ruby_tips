rh = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }

p rh[:a]          #=> {}
p rh[:a][:b]      #=> {}
p rh[:a][:b][:c]  #=> {}
