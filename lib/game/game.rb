require 'board'
require 'player'
require 'console'

class Game
	attr_reader :board
	attr_writer :player_one, :player_two
	
	def initialize(player_one, player_two, output)
		@board = Board.new
		@output = output
		@player_one = player_one
		@player_two = player_two
		@current_player = @player_one
	end
	
	def game_loop
		while !over? 
			play_turn
			switch_player
		end
		result
	end
	
	def play_turn
		begin
		play_at(@current_player.prompt_position(@board), @current_player.marker)
		rescue
		@output.tell_user_bad_move
		play_turn
		end
		@output.show_board(@board)
	end
	
	def play_at(position, marker)
		@board.set_marker(marker, position)
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
			@output.tell_player_1_winner			
		elsif is_winner?('O')
			@output.tell_player_2_winner
		elsif draw?
			@output.tell_draw
		end
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
		count_empty_spaces == 0 
	end
	
	def count_empty_spaces
		@board.spaces.select{|k,v| v == ''}.count
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
