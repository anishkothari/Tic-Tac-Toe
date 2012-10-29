require 'spec_helper'

describe "Player" do
	
	it "passes an input from console to make a move on the board" do
		board = Board.new
		player = Player.new('X')
		player2 = Player.new('O')
		game = Game.new(player, player2)
		game.stub!(:pass_move).and_return("A1")
		pending
		board.empty_position?('A1').should == false
	end
end
