require 'rubocop'
require 'parser/current'
require 'pp'

include RuboCop::Cop::Metrics

code =<<-CODE
def hello
  n = 3
  3 if true
  case n
  when 0
  when 1
  when 2
  else
  end
end
CODE

buffer = Parser::Source::Buffer.new('(string)', 1)
buffer.source = code
builder = RuboCop::AST::Builder.new
node = Parser::CurrentRuby.new(builder).parse(buffer)

p PerceivedComplexity.new.send(:complexity, node)
