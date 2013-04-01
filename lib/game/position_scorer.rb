class Position_Scorer

	def initialize(current_marker, other_marker)
		@current_marker = current_marker
		@other_marker = other_marker
	end

	def return_score(board, current_player)
    rules = Rules.new(board)
    if rules.draw?
      0
		elsif rules.is_winner?(current_player)
			1
    else
      -1
		end
	end

end
