# RUBY_VERSION >= 2.3.0
klasses = ObjectSpace.each_object(Class).reject {|k| k.singleton_class? }.sort_by(&:to_s)
klasses -= [ARGF.class, BasicObject]

methods = {}

klasses.reject! do |k|
  methods[k] = k.instance_methods(false).select {|m| m.to_s.end_with?('?') }
  methods[k].empty?
end

klasses.each do |k|
  mname = "#{k}AprilFool"
  eval("module #{mname}; end")

  m = Object.const_get(mname)

  m.module_eval do
    methods[k].each do |name|
      define_method(name) {|*args, &block| !super(*args, &block) }
    end
  end

  k.class_eval { prepend m }
end

p 1.positive?             #=> false
p 1.negative?             #=> true
p (1..10).include?(3)     #=> false
p (1..10).include?(100)   #=> true
