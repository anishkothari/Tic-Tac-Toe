require 'spec_helper'

describe Board do

	let (:board) {Board.new}
  let (:rules) {Rules.new(board)}
	let(:spaces) {{'A1' => '','A2' => '','A3' => '','B1' => '','B2' => '','B3' => '','C1' => '','C2' => '','C3' => ''}}

	it "stores the marker into a hash with keys A1-C3 for the positions" do
		board.spaces.should == spaces
	end

	context '#set_marker' do

		it "places an X on the board" do
			board.set_marker("X", 'A1')
			board.spaces['A1'].should  == 'X'
		end

		it 'doesnt allow placements of invalid positions' do
			expect {board.set_marker("X", 'Z')}.to raise_error
		end

		it "doesn't allow overwriting a marker on a position that is already set" do
			board.set_marker("X", 'A1')
			expect{board.set_marker("O", 'A1')}.to raise_error
			board.spaces['A1'].should == 'X'
		end

    it "checks for a winning move" do
      board.set_marker("X", 'A1')
      board.set_marker("X", 'A2')
      board.set_marker("X", 'A3')
      rules.is_winner?('X').should be_true
    end

    it "checks for a winning move" do
      board.set_marker("X", 'A1')
      board.set_marker("X", 'A2')
      board.set_marker("X", 'B1')
      rules.is_winner?('X').should be_false
    end

    it "checks for a winning move" do
      board.set_marker("O", 'A1')
      board.set_marker("O", 'A2')
      board.set_marker("O", 'A3')
      rules.is_winner?('O').should be_true
    end

    it "checks for a winning move" do
      board.set_marker("O", 'A1')
      rules.is_winner?('O').should be_false
    end

    it "checks for a winning move" do
      board.set_marker("O", 'A3')
      rules.is_winner?('O').should be_false
    end

    it "returns false for a non-winning move" do
      board.set_marker("X", 'A1')
      board.set_marker("X", 'A2')
      board.set_marker("X", 'A3')
      rules.is_winner?('O').should be_false
    end

    it "calling winning_move? does not make the move" do
      board.set_marker("O", 'A1')
      rules.is_winner?('X').should be_false
      board.spaces['A1'].should == 'O'
    end

    it "returns true for a winning move in row 2" do
      board.set_marker("X", 'B1')
      board.set_marker("X", 'B2')
      board.set_marker("X", 'B3')
      rules.is_winner?('X').should be_true
    end

    it "returns true for a winning move in row 3" do
      board.set_marker("X", 'C1')
      board.set_marker("X", 'C2')
      board.set_marker("X", 'C3')
      rules.is_winner?('X').should be_true
    end

    it "returns true for a winning move in column 1" do
      board.set_marker("X", 'A1')
      board.set_marker("X", 'B1')
      board.set_marker("X", 'C1')
      rules.is_winner?('X').should be_true
    end

    it "returns true for a winning move in column 2" do
      board.set_marker("X", 'A2')
      board.set_marker("X", 'B2')
      board.set_marker("X", 'C2')
      rules.is_winner?('X').should be_true
    end

    it "returns true for a winning move in column 3" do
      board.set_marker("X", 'A3')
      board.set_marker("X", 'B3')
      board.set_marker("X", 'C3')
      rules.is_winner?('X').should be_true
    end

    it "returns true for a winning move in diagonal left to right" do
      board.set_marker("X", 'A1')
      board.set_marker("X", 'B2')
      board.set_marker("X", 'C3')
      rules.is_winner?('X').should be_true
    end

    it "returns true for a winning move in diagonal right to left" do
      board.set_marker("X", 'C1')
      board.set_marker("X", 'B2')
      board.set_marker("X", 'A3')
      rules.is_winner?('X').should be_true
    end

    it "undoes a move" do
      board.set_marker("X", 'C1')
      board.spaces['C1'].should == "X"
      board.undo_move('C1')
      board.spaces['C1'].should == ''
    end

  end

end
