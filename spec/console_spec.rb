require 'spec_helper'
require 'pry'

describe "Console" do

	class FakePositionIO
		def initialize
			@number_of_move_requests = 0
			@moves = []
		end
		
		def play
			game = Game.new
			@moves.count do
				prompt_position
				break if game.over?
			end
		end
		
		def prompt_position
			"B2"
		end
		
		def set_moves(moves)
			@moves += moves
		end
		
		def number_of_move_requests
			@number_of_move_requests
		end
		
	end

	class FakeNameIO
		attr_accessor :names
	
		def initialize
			@names = []
		end
		
		def prompt_player_one
		end
		
		def prompt_player_two
		end
	
	end
	
	it "accepts a user's input" do
		nameIO = mock("nameIO")
		nameIO.stub!(:prompt_player_one).and_return("Anish")
		nameIO.stub!(:prompt_player_two).and_return("Myles")
		gameIO = mock("gameIO")
		gameIO.stub!(:prompt_position).and_return("B2")
		console = Console.new(gameIO)
		console.accept_move(Board.new).should == 'B2'
	end
	
	it "plays a game" do
		
	end
	
	def set_marker_as_winner(marker)
		game.board.markers['A1'] = marker
		game.board.markers['A2'] = marker
		game.board.markers['A3'] = marker
	end
	
end
