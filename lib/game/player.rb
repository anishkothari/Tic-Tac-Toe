require 'console'

class Player

	attr_reader :marker
	
	def initialize(marker)
		@console = Console.new
		@board = Board.new
		@marker = marker
	end
	
	def set_name
		@console.get_name
	end
	
end
