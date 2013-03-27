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
    score = minimax(board, marker)
  end

  def minimax(board, marker)
    # copy the board and/or make a move to see if it ends the game
    # undo the move
    if Rules.new(board).over?
    end
    board.open_spaces.max_by do |space|
      #minimax(space)
      ps = Position_Scorer.new(marker, other_marker)
      score = ps.return_score(board, space)
    end
  end

  def scorer(board, marker, space)
    ps = Position_Scorer.new(marker, other_marker)
    score = ps.return_score(board, space)
  end

  #	def max_move(board, current_marker)
  #    if board.Game.over?
  #      ps = Position_Scorer.new(current_marker, other_marker)
  #      score = ps.return_score(new_board, space)
  #      return score
  #    else
  #      new_board = board.copy_board
  #      new_board.set_marker(current_marker, space)
  #    end
  #    new_board.open_spaces.each do |open_space|
  #      min_move(new_board, marker, open_space)
  #    end
  #    score = min_move(new_board, marker, space)
  #  end

  def min_move(board, current_marker, space)
    max_score = -1
    min_score = 1
    Game.over?
    ps = Position_Scorer.new(current_marker, other_marker)
    score = ps.return_score(board, space)
    score = -negamax(board, marker, space)
  end

end
