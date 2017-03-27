require 'rubocop'
require 'method_source'
require 'parser/current'
require 'pp'

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

code =<<-CODE
if t == 3
else
end
CODE
buffer = Parser::Source::Buffer.new('(string)')
buffer.source = code
builder = RuboCop::AST::Builder.new
n = Parser::CurrentRuby.new(builder).parse(buffer)

n.each_node.with_index(1) do |i, m|
  next if i.type != :if
  pp i
  puts "cost = #{i.else? && !i.elsif? ? 2 : 1}"
end
p PerceivedComplexity.new.send(:complexity, node)
