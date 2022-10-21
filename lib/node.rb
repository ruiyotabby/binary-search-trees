# frozen_string_literal: true

# Object which holds a single element of data and a pointer to the left and right node in the tree.
class Node
  attr_accessor :data, :right, :left

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @right = right
    @left = left
  end
end
