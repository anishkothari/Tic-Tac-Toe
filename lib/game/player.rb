require 'board'

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
		open_move(board)
	end

	def open_move(board)
		board.open_spaces.max_by do |open_space|
			board.with_move(open_space, marker) do
				score = minimax(board, marker)
				p score
				score
			end
		end
	end

  def other_m(m)
    if m == marker
      marker
    else
      other_marker
    end
  end

  def minimax(board, current_marker)
    other = other_m(current_marker)
    if board.won?(current_marker)
      score = 1
    elsif board.draw?
	  score = 0
    elsif board.won?(other)
      score = -1
    else
      board.open_spaces.map do |open_space|
        board.with_move(open_space, other) do
          -1 * minimax(board, other)
        end
      end.max
    end
  end

end
