require 'rubocop'
require 'parser/current'
require 'pp'

include RuboCop::Cop::Metrics

code =<<-CODE
def hello
  3 if true
  3 if true
  3 if true
  3 if true
  3 if true
  3 if true
  3 if true
  3 if true
end
CODE

buffer = Parser::Source::Buffer.new('(string)', 1)
buffer.source = code
builder = RuboCop::AST::Builder.new
node = Parser::CurrentRuby.new(builder).parse(buffer)

n = RuboCop::Cop::VariableForce::Scope.new(node)
p AbcSize.new.send(:complexity, n)
