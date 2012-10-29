require 'board'
require 'player'
require 'console'

class Game
	attr_reader :board, :console
	attr_writer :player_one, :player_two
	
	def initialize(player_one, player_two)
		@board = Board.new
		@console = Console.new
		@player_one = player_one
		@player_two = player_two
		@current_player = @player_one
	end
	
	def game_loop
		play_turn
		result
	end
	
	def play_turn
		pass_move(@board)
	end
	
	def pass_move(board)
		play_at(@current_player.prompt_position, @current_player.marker)
	end
	
	def play_at(position, marker)
		@board.set_marker(marker, position)
		if @board.done == false
			pass_move(@board)
			if over?
				result
			end
		end
		@console.show_board(board)
		switch_player
		play_turn unless over?
	end
	
	def switch_player
		if @current_player == @player_one
			@current_player = @player_two
		else
			@current_player = @player_one
		end
	end
	
	def result
		if is_winner?('X')
			puts "The game is over! Player 1 won!"
		elsif is_winner?('O')
			puts "The game is over! Player 2 won!"
		elsif draw?
			puts "The game has ended in a draw."
		end
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
