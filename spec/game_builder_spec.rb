require 'game_builder'

describe GameBuilder do

	let (:builder) {GameBuilder.new}

	it "introduces itself and explains the game" do
		hello = builder.introduce
		hello.should == "Hello and welcome to Tic Tac Toe."
	end
	
	it "builds a board from the initialize method" do
		builder.board.class.should == GameBoard
	end
	

end
