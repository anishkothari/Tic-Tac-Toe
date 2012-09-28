require 'game_board'

describe GameBoard do
	
	let (:board) {GameBoard.new}
	
	it "builds the board" do
		board.should_not == nil
	end
	
	it "stores the data into a hash with keys 1-8 for the positions" do
		board.data.should == {'0' => '','1' => '','2' => '','3' => '','4' => '','5' => '','6' => '','7' => '','8' => ''}
	end
	
	it "stores X into the 0 position" do
		board.store_value('0', 'X')
		board.data.should == {'0'=>'X','1' => '','2' => '','3' => '','4' => '','5' => '','6' => '','7' => '','8' => ''}
	end
	
	it "stores 0 into the 1 position" do
		board.store_value('1', 'O')
		board.data.should == {'0'=>'','1' => 'O','2' => '','3' => '','4' => '','5' => '','6' => '','7' => '','8' => ''}
	end

	it "puts an X in the 1st position" do
		pending "something something"
	end

end
