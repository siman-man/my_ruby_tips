require 'rubocop'
require 'method_source'
require 'parser/current'
require 'pp'

include RuboCop::Cop::Metrics

def hello
  3 if true
end

buffer = Parser::Source::Buffer.new('(string)')
buffer.source = method(:hello).source
builder = RuboCop::AST::Builder.new
node = Parser::CurrentRuby.new(builder).parse(buffer)

n = RuboCop::Cop::VariableForce::Scope.new(node)
p AbcSize.new.send(:complexity, n)
