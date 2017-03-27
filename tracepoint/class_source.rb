module ClassSource
  @lines_for_file = {}
  @class_source = {}
  @class_pos = Hash.new { |h, k| h[k] = [] }

  TracePoint.trace(:class, :end) do |tp|
    next if tp.self == ClassSource
    @lines_for_file[tp.path] ||= File.readlines(tp.path)

    case tp.event
      when :class
        @class_pos[tp.self][0] = tp.lineno-1
      when :end
        @class_pos[tp.self][1] = tp.lineno-1
        sp, ep = @class_pos[tp.self]
        @class_source[tp.self] = @lines_for_file[tp.path][sp..ep].join
    end
  end

  def self.class_source(klass)
    @class_source[klass]
  end
end

class Class
  def source
    ClassSource.class_source(self)
  end
end

class A
  def hello
    puts 'hello'
  end
end

puts A.source
