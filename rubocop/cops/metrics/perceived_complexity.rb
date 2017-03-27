require 'rubocop'
require 'method_source'
require 'parser/current'

include RuboCop::Cop::Metrics

def hello
  case
  when n == 1
  when n == 2
  when n == 3
  end
end

buffer = Parser::Source::Buffer.new('(string)')
buffer.source = method(:hello).source
builder = RuboCop::AST::Builder.new
node = Parser::CurrentRuby.new(builder).parse(buffer)

puts "cost = #{PerceivedComplexity.new.send(:complexity, node)}"
