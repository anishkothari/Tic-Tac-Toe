require 'game'
require 'board'

class Console
	attr_accessor :board
	
	def initialize
		@board = Board.new
		@output = Output.new(@board)
	end
	
	def show_board(board)
		@output.show_board(board)
	end
	
	def get_name
		@nameIO.prompt_player_name
	end
	
end

class Output

	attr_reader :board
	
	def initialize(board)
	end
	
	def show_board(board)
		puts ""
		puts "\t #{board.markers['A1']} | #{board.markers['A2']} | #{board.markers['A3']} "
		puts "\t -------- "
		puts "\t #{board.markers['B1']} | #{board.markers['B2']} | #{board.markers['B3']} "
		puts "\t -------- "
		puts "\t #{board.markers['C1']} | #{board.markers['C2']} | #{board.markers['C3']} "
		puts ""
	end
end

class NameIO
	
	attr_accessor :names
	
	def initialize
		@names = []
	end

	def prompt_player_name
		puts ""
		puts "Hello. What's your name?"
		@names[0] = gets.chomp
	end
	
end
