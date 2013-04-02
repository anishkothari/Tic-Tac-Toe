require 'spec_helper'

describe Board do

  let (:board) {Board.new}
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

    it "undoes a move" do
      board.set_marker("X", 'C1')
      board.spaces['C1'].should == "X"
      board.undo_move('C1')
      board.spaces['C1'].should == ''
    end

  end

end
