require 'board'
require 'player'
require 'console'
require 'rules'

class Game
  attr_reader :board, :rules
  attr_writer :player_one, :player_two

  def initialize(player_one, player_two, output)
    @board = Board.new
    @rules = Rules.new(@board)
    @output = output
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
  end

  def game_loop
    while !over?
      play_turn
      switch_player
    end
    result
  end

  def play_turn
    begin
      response = @current_player.prompt_position(@board)
      play_at(response, @current_player.marker)
    rescue ArgumentError
      @output.tell_user_bad_move
      play_turn
    end
    @output.show_board(@board)
  end

  def play_at(position, marker)
    @board.set_marker(marker, position)
  end

  def switch_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def result
    if @rules.is_winner?('X')
      @output.tell_player_1_winner
    elsif @rules.is_winner?('O')
      @output.tell_player_2_winner
    elsif @rules.draw?
      @output.tell_draw
    end
  end

  def over?
    @rules.is_winner?('X') || @rules.is_winner?('O') || @rules.draw?
  end

end
