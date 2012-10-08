require 'game_board'

class Game
	attr_reader :board
	
	def initialize
		@board = GameBoard.new
	end
	
	def over?(marker)
		winning_positions.any? do |winning_position|
			winning_position.all? do |space|
				@board.markers[space] == marker
			end
		end
	end
	
	def winning_positions
		[#rows
		['0', '1', '2'],
		['3', '4', '5'],
		['6', '7', '8'],
		#columns
		['0', '3', '6'],
		['1', '4', '7'],
		['2', '5', '8'],
		#diagonals
		['0', '4', '8'],
		['2', '4', '6']
		]
	end
	
	
end
