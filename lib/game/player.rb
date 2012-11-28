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

class UnbeatableAIPlayer < Player

	def prompt_position(board)
		open_move(board)
	end
	
	def open_move(board)
		board.open_spaces.first
	end

end
