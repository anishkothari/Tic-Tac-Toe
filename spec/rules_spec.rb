require 'spec_helper'

describe Board do

	let (:board) {Board.new}
  let (:rules) {Rules.new(board)}
	let(:spaces) {{'A1' => '','A2' => '','A3' => '','B1' => '','B2' => '','B3' => '','C1' => '','C2' => '','C3' => ''}}

	context '#set_marker' do

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

  end

  context "#return_score" do

    it "returns 1 for a winning position" do
      board.set_marker('X', 'A1')
      board.set_marker('X', 'A2')
      board.set_marker('X', 'A3')
      rules.return_score(board, 'X').should == 1
    end

    it "returns 1 for a blocking position" do
      board.set_marker('O', 'B1')
      board.set_marker('O', 'B2')
      board.set_marker('O', 'B3')
      rules.return_score(board, 'O').should == 1
    end

    it "returns -1 for a losing position" do
      board.set_marker('O', 'A3')
      board.set_marker('O', 'A2')
      board.set_marker('X', 'B2')
      rules.return_score(board, 'X').should == -1
    end

    it "returns -1 for a losing position" do
      board.set_marker('O', 'B3')
      board.set_marker('O', 'B2')
      rules.return_score(board, 'A1').should == -1
    end

    it "returns -1 for a losing position" do
      board.set_marker('O', 'B3')
      board.set_marker('O', 'B2')
      rules.return_score(board, 'A3').should == -1
    end

  end

end
