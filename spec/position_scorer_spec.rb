require 'spec_helper'
require 'board'
require 'position_scorer'

describe Position_Scorer do

	let (:board) {Board.new}
	let (:p_s) {Position_Scorer.new('X', 'O')}

	it "returns 0 for an empty board" do
		p_s.return_score(board, 'A1').should == 0
	end
	
	it "returns 1 for a winning position" do
		board.set_marker('X', 'A1')
		board.set_marker('X', 'A2')
		p_s.return_score(board, 'A3').should == 1
	end

	it "returns 1 for a blocking position" do
		board.set_marker('O', 'B1')
		board.set_marker('O', 'B2')
		Position_Scorer.new('O', 'X').return_score(board, 'B3').should == 1
	end
	
	it "returns -1 for a losing position" do
		board.set_marker('O', 'A3')
		board.set_marker('O', 'A2')
		Position_Scorer.new('X', 'O').return_score(board, 'B1').should == -1
	end
	
	it "returns -1 for a losing position" do
		board.set_marker('O', 'B3')
		board.set_marker('O', 'B2')
		Position_Scorer.new('X', 'O').return_score(board, 'A1').should == -1
	end
	
	it "returns -1 for a losing position" do
		board.set_marker('O', 'B3')
		board.set_marker('O', 'B2')
		Position_Scorer.new('X', 'O').return_score(board, 'A3').should == -1
	end
end