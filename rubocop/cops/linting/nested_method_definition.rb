class A
  def foo
    puts "foo"

    def bar
      puts "bar"
    end
  end
end

a = A.new
a.foo
a.bar
