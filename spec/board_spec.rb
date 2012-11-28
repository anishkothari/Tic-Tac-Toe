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
		
		it "doesn't allow overwriting a marker on a position that is already set" do
			board.set_marker("X", 'A1')
			begin; board.set_marker("O", 'A1'); rescue; end
			board.spaces['A1'].should == 'X'
		end
		
		it "returns the open spaces on the board" do
			board.set_marker("X", 'A1')
			board.set_marker("O", 'A2')
			board.open_spaces.should == ['A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
		end
		
		it "raises an exception when a player plays at a non-existing space" do
			expect {board.set_marker("O", 'A11')}.to raise_error
		end
		
		it "returns the rows with open spaces" do
			board.set_marker("X", 'A1')
			board.set_marker("O", 'A2')
			board.set_marker("X", 'A3')
			board.rows_with_open_spaces.should == ["Row 2", "Row 3"]
			board.view_open_row_markers(board.rows_with_open_spaces).should == true
		end
	end
	
end
