# frozen_string_literal: true

require_relative 'node'

# This object creates a BST from an array
class Tree
  attr_reader :root

  def initialize(array)
    @root = quick_sort(array, 0, array.length - 1)
  end

  private

  def quick_sort(array, s, e)
    if s < e
      p = partition(array, s, e)
      quick_sort(array, s, p - 1)
      quick_sort(array, p + 1, e)
    end
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
p t.root
# print t.pretty_print
# p t.quick_sort(array, 0, array.length)
