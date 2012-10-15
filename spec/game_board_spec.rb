require 'game_board'

describe GameBoard do
	
	let (:board) {GameBoard.new}
	let(:markers) {{'A1' => '','A2' => '','A3' => '','B1' => '','B2' => '','B3' => '','C1' => '','C2' => '','C3' => ''}}
	
	it "stores the marker into a hash with keys 0-8 for the positions" do
		board.markers.should == markers
	end
	
	context '#set_marker' do
		
		it "places an X on the board" do
			board.set_marker("X", 'A1')
			board.markers['A1'].should  == 'X'
		end
		
		it 'doesnt allow placements of invalid positions' do
			board.set_marker("X", 'Z')
			board.markers.should  == markers
		end
		
		it "doesn't allow overwriting a marker on a position that is already set" do
			board.set_marker("X", 'A1')
			board.set_marker("O", 'A1')
			board.markers['A1'].should == 'X'
		end
	end
	
end
