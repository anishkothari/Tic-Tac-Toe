require 'game_board'

class GameBuilder

	attr_reader :board

	def initialize
		build_board
	end

	def introduce
		"Hello and welcome to Tic Tac Toe."
	end

	def build_board
		@board = GameBoard.new
	end
	
end

GameBuilder.new.introduce
GameBuilder.new.build_board
