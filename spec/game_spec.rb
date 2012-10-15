require 'game'

describe Game do

	let (:game) {Game.new}
	
	it "the game has a board" do
		game.board.should be_an_instance_of GameBoard
	end
	
	it "returns false if the board is empty" do
		game.is_winner?('S').should == false
	end
	
	it "checks if the board is full" do
		game.board.markers.each_key{ |key| game.board.markers[key] = 'X'}
		game.is_winner?('X').should == true
	end
	
	it "checks if there are three X markers in a row at the 0, 1 and 2 positions" do
		game.board.markers['A1'] = 'X'
		game.board.markers['A2'] = 'X'
		game.board.markers['A3'] = 'X'
		game.is_winner?('X').should == true
	end
	
	it "checks if there are three O markers in a row at the 0, 1 and 2 positions" do
		game.board.markers['A1'] = 'O'
		game.board.markers['A2'] = 'O'
		game.board.markers['A3'] = 'O'
		game.is_winner?('O').should == true
	end
	
	it "ends the game if there are three X markers at 3, 4, 5 positions" do
		game.board.markers['B1'] = 'X'
		game.board.markers['B2'] = 'X'
		game.board.markers['B3'] = 'X'
		game.is_winner?('X').should == true
	end
	
	it "ends the game if there are three X markers at 6, 7, 8 positions" do
		game.board.markers['C1'] = 'X'
		game.board.markers['C2'] = 'X'
		game.board.markers['C3'] = 'X'
		game.is_winner?('X').should == true
	end
	
	it "ends the game if there are three X markers at 0, 3, 6 positions" do
		game.board.markers['A1'] = 'X'
		game.board.markers['B1'] = 'X'
		game.board.markers['C1'] = 'X'
		game.is_winner?('X').should == true
	end
	
	it "ends the game if there are three X markers at 2, 4, 6 positions" do
		game.board.markers['A2'] = 'X'
		game.board.markers['B2'] = 'X'
		game.board.markers['C2'] = 'X'
		game.is_winner?('X').should == true
	end
	
	it "#draw? returns true if there is a draw" do
		game.board.markers['A1'] = 'X'
		game.board.markers['A2'] = 'X'
		game.board.markers['A3'] = 'O'
		game.board.markers['B1'] = 'O'
		game.board.markers['B2'] = 'O'
		game.board.markers['B3'] = 'X'
		game.board.markers['C1'] = 'X'
		game.board.markers['C2'] = 'O'
		game.draw?.should == false
		game.board.markers['C3'] = 'X'
		game.draw?.should == true
	end
	
	it "#over? returns true if there is a draw" do
		set_marker_at_positions('X', ['A1','A2','B3','C1','C3'])
		set_marker_at_positions('O', ['A3','B1','B2','C2'])
		game.over?.should == true
	end
	
	it "#over? returns true if X is in the 0, 1, and 2 positions" do
		set_marker_as_winner('X')
		game.over?.should == true
	end
	
	it "#over? returns false if there are empty spaces" do
		set_marker_at_positions('''', ['A1', 'B2', 'C2'])
		set_marker_at_positions('X', ['A2', 'B3', 'C3'])
		set_marker_at_positions('O', ['A3', 'B1', 'C1'])
		game.over?.should == false
		game.count_empty_spaces.should == 3
	end
	
	it "#number_of_empty_spaces returns 1 for 1 empty space" do
		set_marker_at_positions('X', ['A2', 'B2', 'B3', 'C3'])
		set_marker_at_positions('O', ['A3', 'B1', 'C1', 'C2'])
		game.count_empty_spaces.should == 1
	end
	
	it "#number_of_empty_spaces returns 2 for 2 empty spaces" do
		set_marker_at_positions('X', ['A2', 'B2', 'B3'])
		set_marker_at_positions('O', ['A3', 'B1', 'C1', 'C2'])
		game.count_empty_spaces.should == 2
	end
	
	it "#number_of_empty_spaces returns 9 for 9 empty spaces" do
		game.count_empty_spaces.should == 9
	end
	
	def set_marker_as_winner(marker)
		game.board.markers['A1'] = marker
		game.board.markers['A2'] = marker
		game.board.markers['A3'] = marker
	end
	
	def set_marker_at_positions(marker, positions)
		positions.each {|pos| game.board.markers[pos] = marker}
	end
	
end
