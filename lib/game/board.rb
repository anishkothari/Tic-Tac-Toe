class Board

	attr_accessor :spaces

	def initialize
		@spaces = {'A1' => '',
               'A2' => '',
               'A3' => '',
               'B1' => '',
               'B2' => '',
               'B3' => '',
               'C1' => '',
               'C2' => '',
               'C3' => ''}
	end

	def set_marker(marker, position)
		if valid_move?(position)
			@spaces[position] = marker
		else
			raise ArgumentError.new('Incorrect input.')
		end
	end

  def undo_move(position)
    @spaces[position] = ''
  end

	def valid_move?(position)
		valid_marker?(position) && empty_position?(position)
	end

	def empty_position?(position)
		spaces[position] == ''
	end

	def valid_marker?(position)
		spaces.keys.include?(position)
	end

	def copy_board
		new_board = Board.new
		new_board.spaces = spaces.clone
		new_board
	end

	def open_spaces
		open = []
		spaces.each do |key, value|
			if value == ''
				open << key
			end
		end
		open
	end

end
