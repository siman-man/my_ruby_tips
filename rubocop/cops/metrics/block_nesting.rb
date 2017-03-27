a = %w(ruby python java)

a.map do |i| # nest level 1
  i.chars.each do |c| # nest level 2
    puts c
  end
end
