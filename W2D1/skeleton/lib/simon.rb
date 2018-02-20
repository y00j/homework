class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    begin
    take_turn
    end until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    self.add_random_color
    round_success_message
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "round success"
  end

  def game_over_message
    puts "game over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

end
