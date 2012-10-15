require 'game_board'

class Game
	attr_reader :board
	
	def initialize
		@board = GameBoard.new
	end
	
	def over?
		is_winner?('X') || is_winner?('O') || draw?
	end
	
	def is_winner?(marker)
		winning_positions.any? do |winning_position|
			winning_position.all? do |space|
				@board.markers[space] == marker
			end
		end
	end
	
	def count_empty_spaces
		@board.markers.select{|k,v| v == ''}.count
	end
	
	def draw?
		!@board.markers.has_value?('') && count_empty_spaces == 0 
	end
	
	def winning_positions
		[
		#rows
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
