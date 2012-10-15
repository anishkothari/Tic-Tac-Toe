require 'game_console'

describe "GameConsole" do

	class PositionIO
		def initialize
			@X = 'X'
			@Xpos = ''
			@O = 'O'
			@Opos = ''
		end
		
		def get_player_one_position
			puts ""
			puts "Where do you want to make the first move?"
			@Xpos = gets.chomp
		end
		
	end

	class NameIO
		attr_accessor :names
	
		def initialize
			@names = []
		end
		
		def prompt_player_one
			puts ""
			puts "Hello player one. What's your name?"
			@names[0] = gets.chomp
		end
		
		def prompt_player_two
			puts "Hello player two. What's your name?"
			@names[1] = gets.chomp
		end
	
	end
	
	it "accepts player one's input for their name" do
		nameIO = NameIO.new
		nameIO.stub!(:prompt_player_one).and_return("Anish")
		nameIO.stub!(:prompt_player_two).and_return("Myles")
		positionIO = PositionIO.new
		console = GameConsole.new(nameIO, positionIO)
		console.get_names
		console.players[0].name.should == 'Anish'
		console.players[1].name.should == 'Myles'
	end

	it "accepts player one's lowercase input for placing a marker in the B2 position" do
		nameIO = NameIO.new
		positionIO = PositionIO.new
		positionIO.stub!(:get_player_one_position).and_return("B2")
		console = GameConsole.new(nameIO, positionIO)
		console.get_positions
		console.positions[0].position.should =~ /[(b|B)][2]/
	end
	
	it "accepts player one's input for placing a marker in any of the valid positions on the board" do
		nameIO = NameIO.new
		positionIO = PositionIO.new
		console = GameConsole.new(nameIO, positionIO)
		console.get_positions
		console.positions[0].position.should =~ /[(a|b|c|A|B|C)][1|2|3]/
	end
	
end
