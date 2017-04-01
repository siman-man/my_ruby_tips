klasses = ObjectSpace.each_object(Module).reject {|k| k.singleton_class? }.sort_by(&:to_s)
klasses -= [ARGF.class, BasicObject]

methods = {}

klasses.reject! do |k|
  methods[k] = k.instance_methods(false).select {|m| m.to_s.end_with?('?') } - [:respond_to?]
  methods[k].empty?
end

klasses.each do |k|
  k.class_eval(
    methods[k].map do |name|
      <<-EOF
      alias_method "_#{name}", :#{name}

      def #{name}(*args, &block)
        !_#{name}(*args, &block)
      end
      EOF
    end.join("\n")
  )
end

p (1..10).include?(3)     #=> false
p (1..10).include?(100)   #=> true
p [1, 2, 3].all?(&:odd?)  #=> true
p [1, 2, 3].any?(&:odd?)  #=> false
