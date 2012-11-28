class Board	

	attr_reader :spaces, :rows, :open_rows
	
	def initialize
		@spaces = {'A1' => '','A2' => '','A3' => '','B1' => '','B2' => '','B3' => '','C1' => '','C2' => '','C3' => ''}
		row1 = 'A1', 'A2', 'A3'
		row2 = 'B1', 'B2', 'B3'
		row3 = 'C1', 'C2', 'C3'
		@rows = {"Row 1" => row1, "Row 2" => row2, "Row 3" => row3}
	end
	 
	def set_marker(marker, position)
		if valid_move?(position)
			@spaces[position] = marker
		else
			raise ArgumentError.new('Incorrect input.')
		end
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
	
	def open_spaces
		open = []
		spaces.each do |key, value|
			if value == ''
				open << key
			end
		end
		open
	end
	
	def rows_with_open_spaces
		@open_rows = []
		open_spaces.each do |open_space|
			rows.each { |row, spaces| @open_rows << row if spaces.include?(open_space) }
		end
		@open_rows.uniq
	end
	
	def view_open_row_markers(open_rows)
		values = []
		open_rows[0..2].each do |row|
			values << row.split(", ")
		end
		values
		rows
	end
	
	def x_spaces
		x = []
		spaces.each do |key, value|
			if value == 'X'
				x << key
			end
		end
		x
	end
	
	def o_spaces
		o = []
		spaces.each do |key, value|
			if value == 'O'
				o << key
			end
		end
		o
	end
		
end
