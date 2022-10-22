# frozen_string_literal: true

# Object which holds a single element of data and a pointer to the left and right node in the tree.
class Node
  attr_accessor :data, :right, :left, :parent

  def initialize(data = nil)
    @data = data
    @right = nil
    @left = nil
    @parent = nil
  end
end
