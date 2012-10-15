require 'game_console'

describe "GameConsole" do

	class FakeIO
		attr_accessor :names
	
		def initialize
			@names = []
		end
		
		def get_player_one_name
			@names[0]
		end
		
		def prompt_player_one
			puts ""
			puts "Hello player one. What's your name?"
			@names[0] = gets.chomp
		end
		
		def get_player_two_name
			@names[1]
		end
		
		def prompt_player_two
			puts "Hello player two. What's your name?"
			@names[1] = gets.chomp
		end
	
	end
	
	it "accepts player one's input for their name" do
		fakeIO = FakeIO.new
		console = GameConsole.new(fakeIO)
		console.run
		console.players[0].name.should == 'Anish'
		console.players[1].name.should == 'Myles'
	end
	
end
