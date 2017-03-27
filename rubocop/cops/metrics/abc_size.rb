require 'rubocop'
require 'parser/current'

include RuboCop::Cop::Metrics

code =<<-CODE
def hello
  a = 1
  b = 1
  c = 1
end
CODE

buffer = Parser::Source::Buffer.new('(string)')
buffer.source = code
builder = RuboCop::AST::Builder.new
node = Parser::CurrentRuby.new(builder).parse(buffer)

n = RuboCop::Cop::VariableForce::Scope.new(node)
puts "cost = #{AbcSize.new.send(:complexity, n)}"
