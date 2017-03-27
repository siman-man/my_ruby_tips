def hello
  a = [1, 2, 3].map do |i|
    n = i * 2
    t = n**n
    m = t / 2
    s <<-CODE
    Hi my name is ruby.
    thenk you
    CODE

    s + m.to_s
  end

  a
end
