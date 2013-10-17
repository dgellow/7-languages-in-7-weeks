# Day 2
#######
## Task 1
# Print the content of an array of sixteen numbers, four numbers at a time,
# using just `each'.
arr = []
(1..16).to_a.each do |n|
  arr << n
  if (n % 4).zero?
    puts arr.join
    arr = []
  end
end

##Now, do the same with `each_slice' in 'Enumerable`.
(1..16).each_slice(4).each {|arr| puts arr.join}

## Task 2
# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this:
# {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children={})
    @node_name = name
    @children = children.map {|key, value| Tree.new(key, value)}
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

family_tree = Tree.new("Family", {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
family_tree.visit_all {|node| puts node.node_name}
# => Family
#    grandpa
#    dad
#    child 1
#    child 2
#    uncle
#    child 3
#    child 4
