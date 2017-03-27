require 'rubocop'
require 'method_source'
require 'parser/current'

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

puts "cost = #{CyclomaticComplexity.new.send(:complexity, node)}"
