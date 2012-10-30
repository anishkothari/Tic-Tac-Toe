require 'board'

class Player

	attr_reader :marker
	
	def initialize(marker)
		@marker = marker
	end
	
	def prompt_position
		puts "\nWhere do you want to play?"
		gets.chomp.upcase
	end
	
end

class AIPlayer

	attr_reader :marker, :board

	def initialize(marker, board)
		@marker = marker
		@board = board
	end

	def prompt_position
		keys = @board.spaces.keys
		@move = keys[Random.new.rand(0..8)]
		p "The Computer plays at " + @move.to_s
		@move
	end

end
