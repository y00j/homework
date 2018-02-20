class PolyTreeNode
  attr_reader :children, :value, :parent
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent
    parent.children << self unless parent.nil? || parent.children.include?(self)
  end

  def inspect
    value
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "node is not a child"
    end
  end

  def dfs(target_value)

    return self if self.value == target_value
    return nil if self.children.empty?
    target_status = nil
    self.children.each do |child|
      target_status = child.dfs(target_value)
      return target_status if target_status
    end

    nil
  end

  def bfs(target_value)
    queue = []
    queue << self

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue += current_node.children
    end

    nil
  end


end
