class GameBoard	

	attr_reader :markers

	def initialize
		@markers = {
		'0' => '','1' => '','2' => '','3' => '','4' => '','5' => '','6' => '','7' => '','8' => ''}
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


