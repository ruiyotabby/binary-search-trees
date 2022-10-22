# frozen_string_literal: true

require_relative 'node'

# This object creates a BST from an array
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(quick_sort(array, 0, array.length - 1), 0, array.length - 1)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(node)
    _insert(node)
  end

  def delete(node)
    _delete(node)
  end

  def find(value, node = @root)
    return nil if @root.nil?
    return node if value == node.data
    return find(value, node.left) if value < node.data
    return find(value, node.right) if value > node.data
  end

  private

  def _delete(node)
    if node.left.nil?
      transplant(node, node.right)
    elsif node.right.nil?
      transplant(node, node.left)
    else
      successor = minimum(node.right)
      unless successor.parent == node
        transplant(successor, successor.right)
        successor.right = node.right
        successor.right.parent = successor
      end
      transplant(node, successor)
      successor.left = node.left
      successor.length.parent = successor
    end
  end

  def minimum(node)
    node = node.left until node.left.nil?
  end

  def transplant(node, replace_node)
    if node.parent.nil?
      @root = replace_node
    elsif node == node.parent.left
      node.parent.left = replace_node
    elsif node == node.parent.right
      node.parent.right = replace_node
    end
    replace_node.parent = node.parent unless replace_node.nil?
  end

  def _insert(node)
    parent_pointer = nil
    x = @root
    until x.nil?
      parent_pointer = x
      if node.data < x.data
        x = x.left
      else
        x = x.right
      end
    end
    node.parent = parent_pointer
    if parent_pointer.nil?
      @root = node
    elsif node.data < parent_pointer.data
      parent_pointer.left = node
    else
      parent_pointer.right = node
    end
  end

  def build_tree(array, s, e)
    return nil if s > e

    mid = (e + s) / 2

    node = Node.new(array[mid])

    node.left = build_tree(array, s, mid - 1)
    node.left.parent = node unless node.left.nil?

    node.right = build_tree(array, mid + 1, e)
    node.right.parent = node unless node.right.nil?

    node
  end

  def quick_sort(array, s, e)
    if s < e
      p = partition(array, s, e)
      quick_sort(array, s, p - 1)
      quick_sort(array, p + 1, e)
    end
    array.uniq!
    array
  end

  def partition(array, s, e)
    x = array[e]
    i = s - 1
    (s...e).each do |j|
      next unless array[j] <= x

      i += 1
      swap(array, i, j)
    end
    swap(array, (i + 1), e)
    i + 1
  end

  def swap(array, i, j)
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    array
  end
end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
t = Tree.new array
p array
# p t.root
# print t.pretty_print
m = Node.new 13
t.insert(m)
n = Node.new 2
t.insert n
p t.root
puts t.pretty_print
t.delete(m)
puts t.pretty_print
p t.find 7

