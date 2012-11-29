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
		open_move(board)
	end

	def open_move(board)
		board.open_spaces.max_by do |open_space|
			score = minimax(board, marker, open_space)
		end
	end

	def minimax(board, current_marker, space)
		ps = Position_Scorer.new(current_marker, other_marker)
		ps.return_score(board, space)
	end

end
