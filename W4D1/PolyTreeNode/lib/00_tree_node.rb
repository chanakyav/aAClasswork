# frozen_string_literal: true

class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node.nil?
      @parent = nil
    else
      @parent&.children&.delete(self)
      @parent = node
      node.children << self unless node.children.include?(self)
    end
  end

  def add_child(node)
    node.parent = self
    @children << node unless @children.include?(node)
  end

  def remove_child(node)
    raise 'Given node is not a child' unless @children.include?(node)

    node.parent = nil
  end

  # def inspect
  #     @value.inspect
  #     @parent.inspect
  #     @children.inspect
  # end

  def dfs(target)
    return self if value == target

    @children.each do |child|
      node = child.dfs(target)
      return node unless node.nil?
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target

      node.children.each { |child| queue.push(child) }
    end
    nil
  end
end
