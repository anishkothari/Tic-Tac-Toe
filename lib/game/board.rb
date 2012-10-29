class Board	

	attr_reader :markers, :done

	def initialize
		@markers = {
		'A1' => '','A2' => '','A3' => '','B1' => '','B2' => '','B3' => '','C1' => '','C2' => '','C3' => ''}
		@done = false
	end
	 
	def set_marker(marker, position)
		if valid_move?(position)
			@markers[position] = marker
			@done = true
		elsif valid_marker?(position) == false
			puts "Error: that space doesn't exist. Please try again."
			position.to_s
			@done = false
		elsif empty_position?(position) == false
			puts "Error: that space is already filled. Please try again."
			@done = false
		end
	end
	
	def move_is_valid!(position)
	  raise TicTacToe::InvalidMove, position.to_s unless valid_move?(position)
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