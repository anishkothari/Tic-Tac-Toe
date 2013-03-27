class Position_Scorer

	def initialize(current_marker, other_marker)
		@current_marker = current_marker
		@other_marker = other_marker
	end

	def player_will_win(board, position)
		new_board = board.copy_board
		new_board.set_marker(@current_marker, position)
		Rules.new(new_board).is_winner?(@current_marker)
	end

	def other_player_will_win(board, position)
		new_board = board.copy_board
		new_board.set_marker(@other_marker, position)
		Rules.new(new_board).is_winner?(@other_marker)
	end

	def player_will_lose_in_the_future(board, position)
		result = false
		new_board = board.copy_board
		new_board.set_marker(@current_marker, position)
		new_board.open_spaces.each do |space|
			ps = Position_Scorer.new(@other_marker, @current_marker)
			if ps.return_score(new_board, space) == 1
				result = true
			end
		end
		result
	end

	def return_score(board, position)
		if player_will_win(board, position)
			1
		elsif other_player_will_win(board, position)
			1
		elsif player_will_lose_in_the_future(board, position)
			-1
		else
			0
		end
	end

end
