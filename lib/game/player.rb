require 'board'
require 'position_scorer'

class Player

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

end

class HumanPlayer < Player

  def prompt_position(board)
    gets.chomp.upcase
  end

end

class EasyAIPlayer < Player

  def prompt_position(board)
    random_move(board)
  end

  def random_move(board)
    board.open_spaces.sample
  end

end

class UnbeatableAIPlayer

  attr_reader :marker, :other_marker

  def initialize(marker, other_marker)
    @marker = marker
    @other_marker = other_marker
  end

  def prompt_position(board)
    spaces = score_open_spaces(board)
    spaces.key(spaces.values.max)
  end

  def score_open_spaces(board)
    spaces = {}
    board.open_spaces.each do |space|
      board.set_marker(marker, space)
      spaces[space] = -minimax(board)
      board.undo_move(space)
    end
    return spaces
  end

  def calculate_current_player(board)
    board.open_spaces.count % 2 == 0 ? marker : other_marker
  end

  def minimax(board, ply = 1.0)
    current_player = calculate_current_player(board)
    if Rules.new(board).over?
      return Position_Scorer.return_score(board, current_player)
    end
    max = -1000
    board.open_spaces.each do |space|
      board.set_marker(current_player, space)
      score = -minimax(board, ply + 1)
      max = score if score > max
      board.undo_move(space)
    end
    return max/ply
  end

end
