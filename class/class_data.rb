class A
  class << self
    def public_class_hoge
    end

    protected

    def protected_class_hoge
    end

    private

    def private_class_hoge
    end
  end

  def public_hoge
  end

  protected

  def protected_hoge
  end

  private

  def private_hoge
  end
end

p Range.constants(false)
p Range.public_methods(false)
p Range.protected_methods(false)
p Range.private_methods(false)

p Range.new(1,2).private_methods(false)
p Range.new(1,2).protected_methods(false)
p Range.new(1,2).public_methods(false)
