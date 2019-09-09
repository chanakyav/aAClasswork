# frozen_string_literal: true

require '../PolyTreeNode/lib/00_tree_node.rb'

class KnightPathFinder
  attr_reader :considered_positions, :root_node

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    build_move_tree
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      node = queue.shift
      positions = new_move_positions(node.value)
      positions.each do |pos|
        new_node = PolyTreeNode.new(pos)
        node.add_child(new_node)
        queue << new_node
      end
    end
  end

  def find_path(end_pos)
    result = @root_node.bfs(end_pos)
    trace_path_back(result) unless result.nil?
  end

  def trace_path_back(node)
    path = [node.value]

    until node.parent.nil?
      path << node.parent.value
      node = node.parent
    end

    path.reverse
  end

  def new_move_positions(pos)
    x, y = pos
    positions = [[x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1],
                 [x + 1, y + 2], [x - 1, y + 2], [x + 1, y - 2], [x - 1, y - 2]]

    positions.select! { |sub| KnightPathFinder.valid_moves?(sub) && !@considered_positions.include?(sub) }
    @considered_positions += positions
    positions
  end

  def self.valid_moves?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end
end

if $PROGRAM_NAME == __FILE__

  kpf = KnightPathFinder.new([0, 0])

  p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
  p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

end
