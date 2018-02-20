require_relative 'player'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    self.place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      cup.concat([:stone, :stone, :stone, :stone]) unless idx == 13 || idx == 6
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if !@cups[start_pos] || @cups[start_pos].empty?
      raise "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)

    current_player = current_player_name == @player1.name ? @player1 : @player2

    skip_idx = current_player == @player1 ? 13 : 6
    store = @cups[start_pos].length
    @cups[start_pos] = []

    until store == 0
      start_pos = (start_pos + 1) % 14
      if start_pos != skip_idx
        @cups[start_pos] << :stone
        store -= 1
      end
    end

    render

    next_turn(start_pos)

  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[7..12].all? { |cup| cup.length == 0 } || cups[0..5].all? { |cup| cup.length == 0 }
  end

  def winner
    case @cups[13] <=> @cups[6]
    when 1
      @player2.name
    when 0
      :draw
    else
      @player1.name
    end
  end
end
