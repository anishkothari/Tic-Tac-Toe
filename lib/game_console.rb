class GameConsole

	def initialize(io)
		@io = io
		@players = []
	end
	
	def players
		@players
	end
	
	def run
		player_one_name = @io.prompt_player_one
		player_two_name = @io.prompt_player_two
		@players << Player.new(player_one_name)
		@players << Player.new(player_two_name)
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
		
	def get_player_two_name
		@names[1]
	end
		
	def prompt_player_two
		puts "Hello player two. What's your name?"
		@names[1] = gets.chomp
	end
end

class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end

end


nameIO = NameIO.new
console = GameConsole.new(nameIO)
console.run
