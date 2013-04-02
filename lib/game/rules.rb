require 'board'

class Rules

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def over?
    is_winner?('X') || is_winner?('O') || draw?
  end

  def is_winner?(marker)
    winning_positions.any? do |winning_position|
      winning_position.all? do |space|
        @board.spaces[space] == marker
      end
    end
  end

  def draw?
    !is_winner?('X') && !is_winner?('O') && count_empty_spaces == 0
  end

  def count_empty_spaces
    @board.spaces.select{|k,v| v == ''}.count
  end

  def return_score(board, current_player)
    if draw?
      0
    elsif is_winner?(current_player)
      1
    else
      -1
    end
  end

  def winning_positions
    [
    #rows
    ['A1', 'A2', 'A3'],
    ['B1', 'B2', 'B3'],
    ['C1', 'C2', 'C3'],
    #columns
    ['A1', 'B1', 'C1'],
    ['A2', 'B2', 'C2'],
    ['A3', 'B3', 'C3'],
    #diagonals
    ['A1', 'B2', 'C3'],
    ['A3', 'B2', 'C1']
    ]
  end

end
