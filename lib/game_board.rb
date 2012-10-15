class GameBoard	

	attr_reader :markers

	def initialize
		@markers = {
		'A1' => '','A2' => '','A3' => '','B1' => '','B2' => '','B3' => '','C1' => '','C2' => '','C3' => ''}
	end
	
	def set_marker(marker, position)
		if valid_move?(position)
			@markers[position] = marker
		end
	end
	
	def valid_move?(position)
		empty_position?(position) && valid_marker?(position)
	end
	
	def empty_position?(position)
		@markers[position] == ''
	end
	
	def valid_marker?(position)
		@markers.keys.include?(position)
	end

		
end


