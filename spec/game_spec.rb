require 'game'

describe Game do

	let (:game) {Game.new}
	
	it "the game has a board" do
		game.board.should be_an_instance_of GameBoard
	end
	
	it "returns false if the board is empty" do
		game.over?('S').should == false
	end
	
	it "checks if the board is full" do
		game.board.markers.each_key{ |key| game.board.markers[key] = 'X'}
		game.over?('X').should == true
	end
	
	it "checks if there are three X markers in a row at the 0, 1 and 2 positions" do
		game.board.markers['0'] = 'X'
		game.board.markers['1'] = 'X'
		game.board.markers['2'] = 'X'
		game.over?('X').should == true
	end
	
	it "checks if there are three O markers in a row at the 0, 1 and 2 positions" do
		game.board.markers['0'] = 'O'
		game.board.markers['1'] = 'O'
		game.board.markers['2'] = 'O'
		game.over?('O').should == true
	end
	
	it "ends the game if there are three X markers at 3, 4, 5 positions" do
		game.board.markers['3'] = 'X'
		game.board.markers['4'] = 'X'
		game.board.markers['5'] = 'X'
		game.over?('X').should == true
	end
	
	it "ends the game if there are three X markers at 6, 7, 8 positions" do
		game.board.markers['6'] = 'X'
		game.board.markers['7'] = 'X'
		game.board.markers['8'] = 'X'
		game.over?('X').should == true
	end
	
	it "ends the game if there are three X markers at 0, 3, 6 positions" do
		game.board.markers['0'] = 'X'
		game.board.markers['3'] = 'X'
		game.board.markers['6'] = 'X'
		game.over?('X').should == true
	end
	
	it "ends the game if there are three X markers at 2, 4, 6 positions" do
		game.board.markers['2'] = 'X'
		game.board.markers['4'] = 'X'
		game.board.markers['6'] = 'X'
		game.over?('X').should == true
	end

end
