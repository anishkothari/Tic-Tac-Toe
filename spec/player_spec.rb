require 'spec_helper'

describe "Player" do
	
	it "passes an input from console to make a move on the board" do
		board = Board.new
		player = Player.new('X')
		player.pass_move(board)
		board.empty_position?('A1').should == false
	end
end
