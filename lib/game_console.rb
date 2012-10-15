class GameConsole
	attr_accessor :players, :positions

	def initialize(nameIO, playerIO)
		@nameIO = nameIO
		@playerIO = playerIO
		@players = []
		@positions = []
	end
	
	def get_names
		player_one_name = @nameIO.prompt_player_one
		player_two_name = @nameIO.prompt_player_two
		@players << Player.new(player_one_name)
		@players << Player.new(player_two_name)
	end
	
	def get_positions
		player_one_first_move = @playerIO.get_player_one_position
		@positions << Position.new(player_one_first_move)
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

class PlayerIO
	
	attr_accessor :positions
	
	def initialize
		@positions = []
	end

	def get_player_one_position
		puts ""
		puts "Player One: Where do you want to play?"
		@positions[0] = gets.chomp
	end
	
end

class Position
	attr_reader :position
	
	def initialize(position)
		@position = position
	end
end

class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end

end


#nameIO = NameIO.new
#console = GameConsole.new(nameIO)
#console.get_names
#console.get_positions
