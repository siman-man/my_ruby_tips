module Debugtrace
  module BacktraceWithArguments
    def set_backtrace(errinfo)
      debugtrace = errinfo.map do |msg|
        "\e[#31m#{msg}\e[m"
      end

      super(debugtrace)
    end
  end
end

class Exception
  prepend Debugtrace::BacktraceWithArguments
end

raise Exception.new('error!')
