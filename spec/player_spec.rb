require 'spec_helper'

describe "AIPlayer" do
	
	it "#prompt_position makes a random move for the AI" do
		board = Board.new
		human = Player.new('X')
		ai = AIPlayer.new('O', board)
		move = ai.prompt_position
		keys = board.spaces.keys.include?(move)
		keys.should == true
	end

end
