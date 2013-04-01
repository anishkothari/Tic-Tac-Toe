class Position_Scorer

	def self.return_score(board, current_player)
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
