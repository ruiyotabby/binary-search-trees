require_relative 'tree'

array = (Array.new(10_000_000) { rand(1...999_999_999) })
tree = Tree.new array
p 'done, creating a tree'

arr1 = (Array.new(1_000_000) { rand(1..9_999_999) })
500.times do
  tree.insert(arr1.sample)
end
p tree.balanced?
tree.rebalance
p tree.balanced?
# p tree.pretty_print
# p tree.inorder
# p true if tree.find(15).is_a? Node
