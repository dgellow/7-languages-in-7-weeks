#!/bin/env ruby

class Tree
  # Generate a class variable, an accessor and a setter for each given symbol
  attr_accessor :children, :node_name

  # Constructor
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  # A recursive method running through all Tree nodes
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  # Invokes the given block passing the current object as parameter
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
# => Ruby

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
# => Ruby
#    Reia
#    MacRuby
