class GameBoard	

	attr_reader :data

	def initialize
		@data = {'0' => '','1' => '','2' => '','3' => '','4' => '','5' => '','6' => '','7' => '','8' => ''}
	end

	def store_value(position, marker)
		@data[position] = marker
	end

		
end


