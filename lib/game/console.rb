require 'board'

# There used to be a Console class here

class Output

	attr_reader :board
	
	def show_board(board)
		puts ""
		puts "\t #{board.spaces['A1']} | #{board.spaces['A2']} | #{board.spaces['A3']} "
		puts "\t -------- "
		puts "\t #{board.spaces['B1']} | #{board.spaces['B2']} | #{board.spaces['B3']} "
		puts "\t -------- "
		puts "\t #{board.spaces['C1']} | #{board.spaces['C2']} | #{board.spaces['C3']} "
		puts ""
	end
end
