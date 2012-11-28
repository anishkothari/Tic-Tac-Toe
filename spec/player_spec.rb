require 'spec_helper'

describe "AIPlayer" do

	let (:board) {Board.new}
	let (:human) {Player.new('X')}
	let (:ai) {EasyAIPlayer.new('O')}
	let (:unbeatable) {UnbeatableAIPlayer.new('O')}
	let (:move) {ai.prompt_position(board)}
	
	it "#prompt_position returns only positions which exist on the board" do
		results = []
		100.times do results << ai.prompt_position(board) end
		results.uniq.sort.should == board.open_spaces
	end
	
	it "#prompt_position returns only non-marked positions" do
		board.set_marker("X", 'A1')
		board.set_marker("O", 'A2')
		results = []
		100.times do results << ai.prompt_position(board) end
		results.uniq.sort.should == board.open_spaces
	end
	
	it "unbeatable_ai#prompt_position returns the winning move if available" do
		board.set_marker("O", 'A1')
		board.set_marker("O", 'A2')
		unbeatable.prompt_position(board).should == 'A3'
	end
	
	it "unbeatable_ai#prompt_position returns the winning move if available" do
		board.set_marker("O", 'B1')
		board.set_marker("O", 'B2')
		unbeatable.prompt_position(board).should == 'B3'
	end

end
