class PolyTreeNode
  attr_reader :children, :value, :parent
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    @parent = parent
    parent.children << self
  end

  def inspect
    value
  end



end
