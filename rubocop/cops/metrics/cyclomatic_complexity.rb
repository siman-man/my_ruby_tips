require 'rubocop'
require 'method_source'
require 'parser/current'
require 'pp'

include RuboCop::Cop::Metrics

def hello
  if true
  elsif true
  end
end

buffer = Parser::Source::Buffer.new('(string)')
buffer.source = method(:hello).source
builder = RuboCop::AST::Builder.new
node = Parser::CurrentRuby.new(builder).parse(buffer)

p CyclomaticComplexity.new.send(:complexity, node)
