require 'console'

class Player

	attr_reader :marker
	
	def initialize(marker, console = Console.new)
		@console = console
		@marker = marker
	end
	
	def prompt_position
		puts "\nWhere do you want to play?"
		gets.chomp.upcase
	end
	
end
