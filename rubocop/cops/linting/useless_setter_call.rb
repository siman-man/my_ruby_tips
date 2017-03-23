class A
  def initialize(y, x)
    n = Struct.new(:Node, :x, :y)
    n.y = y
    n.x = x

    @n = n
  end
end
