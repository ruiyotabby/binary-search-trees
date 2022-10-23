require_relative 'tree'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
t = Tree.new array
p array
# p t.root
# print t.pretty_print
m = Node.new 13
o = Node.new 12
t.insert o
t.insert(m)
n = Node.new 2
t.insert n
p t.root
# t.delete(m)
puts t.pretty_print
p t.find 444
t.level_order { |node| puts "Here is node #{node}"}
p t.level_order
p t.height o
p t.depth o
p t.inorder
p t.preorder
p t.postorder
