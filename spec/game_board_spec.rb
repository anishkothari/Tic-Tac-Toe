require 'game_board'

describe GameBoard do
	
	let (:board) {GameBoard.new}
	let(:markers) {{'0' => '','1' => '','2' => '','3' => '','4' => '','5' => '','6' => '','7' => '','8' => ''}}
	
	it "stores the marker into a hash with keys 0-8 for the positions" do
		board.markers.should == markers
	end
	
	context '#set_marker' do
		
		it "places an X on the board" do
			board.set_marker("X", '0')
			board.markers['0'].should  == 'X'
		end
		
		it 'doesnt allow placements of invalid positions' do
			board.set_marker("X", 'Z')
			board.markers.should  == markers
		end
		
		it "doesn't allow overwriting a marker on a position that is already set" do
			board.set_marker("X", '0')
			board.set_marker("O", '0')
			board.markers['0'].should == 'X'
		end
	end
	
end
