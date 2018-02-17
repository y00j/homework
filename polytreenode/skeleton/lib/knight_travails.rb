require_relative '00_tree_node'


class KnightPathFinder
  attr_reader :root_node, :starting_pos, :visited_positions
  def initialize(position)
    @starting_pos = position
    @root_node = PolyTreeNode.new(position)
    @visited_positions = [position]
  end

  def build_move_tree
    nodes = [@root_node]
    node_queue = [@root_node]
    until node_queue.empty?
      current_node = node_queue.shift
      move_positions = new_move_positions(current_node.value)
      move_positions.each do |pos|
        @visited_positions << pos
        curr_child = PolyTreeNode.new(pos)
        nodes << curr_child
        current_node.add_child(curr_child)
        node_queue << curr_child
      end
    end

    nodes
  end

  def new_move_positions(position)
    moves = KnightPathFinder.valid_moves(position)
    moves.reject {|move| @visited_positions.include?(move)}
  end

  def self.valid_moves(position)
    possible_moves = []

    possible_moves << [position[0] + 1, position[1] + 2]
    possible_moves << [position[0] + 1, position[1] + -2]
    possible_moves << [position[0] + -1, position[1] + 2]
    possible_moves << [position[0] + -1, position[1] + -2]
    possible_moves << [position[0] + 2, position[1] + 1]
    possible_moves << [position[0] + 2, position[1] + -1]
    possible_moves << [position[0] + -2, position[1] + 1]
    possible_moves << [position[0] + -2, position[1] + -1]

    possible_moves.select do |move|
      move[0] >= 0 && move[1] >= 0 && move[0] < 8 && move[1] < 8
    end
    # [2,-2].each do |el1|
    #   [1,-1].each do |el2|
    #     first = position[0] + el1
    #     second = position[1] + el2
    #     on_board = first >= 0 && second >= 0 && first < 8 && second < 8
    #
    #     if on_board
    #       possible_moves << [position[0] + el1, position[1] + el2]
    #       possible_moves << [position[0] + el2, position[1] + el1] unless first == second
    #     end
    #
    #   end
    # end
      # possible_moves
  end

  def find_path(end_pos)
    target = @root_node.dfs(end_pos)
    trace_path_back(target)
  end

  def trace_path_back(target)
    path = [target.value]

    until target.parent.nil?
      target = target.parent
      path.unshift(target.value)
    end

    path
  end
end
