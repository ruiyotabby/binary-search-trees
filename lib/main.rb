require_relative 'tree'

array = (Array.new(15) { rand(1...1000) })
tree = Tree.new array

arr1 = (Array.new(900) { rand(1..999) })
(0..500).each do |i|
  tree.insert(arr1.sample)
end
p tree.balanced?
tree.rebalance
p tree.balanced?
# p tree.pretty_print
# p tree.inorder
