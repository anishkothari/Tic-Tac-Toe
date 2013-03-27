require 'spec_helper'

describe Game do

	let (:game) {Game.new(Player.new('X'), Player.new('O'), Output.new)}
  let (:rules) {Rules.new(game.board)}
	let (:fake_output) {
		FakeOutput.new
	}
	let (:fake_game) {
		player1 = FakePlayer.new([], 'X')
		player2 = FakePlayer.new([], '0')
		game = Game.new(player1, player2, fake_output)
	}
	let (:console) {Console.new}

	class FakePlayer

		attr_reader :prompted

		def initialize(moves, marker='X')
			@moves = moves
			@prompted = 0
			@marker = marker
		end

		def marker
			@marker
		end

		def prompt_position(board)
			@prompted += 1
			@moves.shift
		end
	end

	class FakeOutput

		attr_reader :times_told_user_about_bad_move, :shown_board, :told_player1_winner, :told_player2_winner, :told_draw

		def initialize
			@shown_board = 0
			@times_told_user_about_bad_move = 0
			@told_player1_winner = false
			@told_player2_winner = false
			@told_draw = false
		end

		def show_board(board)
			@shown_board += 1
		end

		def tell_user_bad_move
			@times_told_user_about_bad_move += 1
		end

		def tell_player_1_winner
			@told_player1_winner = true
		end

		def tell_player_2_winner
			@told_player2_winner = true
		end

		def tell_draw
			@told_draw = true
		end
	end

	it "prompts player one to go first" do
		player1 = FakePlayer.new(['A1', 'B2', 'B3', 'B1'], 'X')
		player2 = FakePlayer.new(['C1', 'C2', 'A3'], '0')
		fakeOut = FakeOutput.new
		game = Game.new(player1, player2, fakeOut)
		game.game_loop
		player1.prompted.should == 4
		player2.prompted.should == 3
	end

	def set_winner(game, marker)
		game.board.spaces['A1'] = marker
		game.board.spaces['A2'] = marker
		game.board.spaces['A3'] = marker
	end

	it "displays a message when player one has won the game" do
		set_winner(fake_game, 'X')
		fake_game.result
		fake_output.told_player1_winner.should be_true
	end

	def set_draw(game)
		game.board.spaces['A1'] = 'X'
		game.board.spaces['A2'] = 'X'
		game.board.spaces['A3'] = 'O'
		game.board.spaces['B1'] = 'O'
		game.board.spaces['B2'] = 'O'
		game.board.spaces['B3'] = 'X'
		game.board.spaces['C1'] = 'X'
		game.board.spaces['C2'] = 'O'
		game.board.spaces['C3'] = 'X'
	end

	it "displays a message when there was a draw" do
		set_draw(fake_game)
		fake_game.result
		fake_output.told_draw.should be_true
	end

	it "displays a message when player one has won the game" do
		set_winner(fake_game, 'X')
		fake_game.result
		fake_output.told_player1_winner.should be_true
	end

	it 'prompts the user multiple times if they input a bad move' do
		player = FakePlayer.new(['XX', 'XX', 'A1'])
		output = FakeOutput.new
		game = Game.new(player, FakePlayer.new(['A2']*150), output)
		game.play_turn
		player.prompted.should == 3
	end

	it 'tells the user when the make a bad move' do
		player = FakePlayer.new(['XX', 'XX', 'A1'])
		output = FakeOutput.new
		game = Game.new(player, Player.new('O'), output)
		game.play_turn
		output.times_told_user_about_bad_move.should == 2
	end

	it "the game has a board" do
		game.board.should be_an_instance_of Board
	end

	it "returns false if the board is empty" do
		rules.is_winner?('S').should == false
	end

	it "checks if the board is full" do
		game.board.spaces.each_key{ |key| game.board.spaces[key] = 'X'}
		rules.is_winner?('X').should == true
	end

	it "checks if there are three X spaces in a row at the 0, 1 and 2 positions" do
		game.board.spaces['A1'] = 'X'
		game.board.spaces['A2'] = 'X'
		game.board.spaces['A3'] = 'X'
		rules.is_winner?('X').should == true
	end

	it "checks if there are three O spaces in a row at the 0, 1 and 2 positions" do
		game.board.spaces['A1'] = 'O'
		game.board.spaces['A2'] = 'O'
		game.board.spaces['A3'] = 'O'
		rules.is_winner?('O').should == true
	end

	it "ends the game if there are three X spaces at 3, 4, 5 positions" do
		game.board.spaces['B1'] = 'X'
		game.board.spaces['B2'] = 'X'
		game.board.spaces['B3'] = 'X'
		rules.is_winner?('X').should == true
	end

	it "ends the game if there are three X spaces at 6, 7, 8 positions" do
		game.board.spaces['C1'] = 'X'
		game.board.spaces['C2'] = 'X'
		game.board.spaces['C3'] = 'X'
		rules.is_winner?('X').should == true
	end

	it "ends the game if there are three X spaces at 0, 3, 6 positions" do
		game.board.spaces['A1'] = 'X'
		game.board.spaces['B1'] = 'X'
		game.board.spaces['C1'] = 'X'
		rules.is_winner?('X').should == true
	end

	it "ends the game if there are three X spaces at 2, 4, 6 positions" do
		game.board.spaces['A2'] = 'X'
		game.board.spaces['B2'] = 'X'
		game.board.spaces['C2'] = 'X'
		rules.is_winner?('X').should == true
	end

	it "#draw? returns true if there is a draw" do
		game.board.spaces['A1'] = 'X'
		game.board.spaces['A2'] = 'X'
		game.board.spaces['A3'] = 'O'
		game.board.spaces['B1'] = 'O'
		game.board.spaces['B2'] = 'O'
		game.board.spaces['B3'] = 'X'
		game.board.spaces['C1'] = 'X'
		game.board.spaces['C2'] = 'O'
		rules.draw?.should == false
		game.board.spaces['C3'] = 'X'
		rules.draw?.should == true
	end

	it "#over? returns true if there is a draw" do
		set_marker_at_positions('X', ['A1','A2','B3','C1','C3'])
		set_marker_at_positions('O', ['A3','B1','B2','C2'])
		rules.over?.should == true
	end

	it "#over? returns true if X is in the 0, 1, and 2 positions" do
		set_marker_as_winner('X')
		rules.over?.should == true
	end

	it "#over? returns false if there are empty spaces" do
		set_marker_at_positions('''', ['A1', 'B2', 'C2'])
		set_marker_at_positions('X', ['A2', 'B3', 'C3'])
		set_marker_at_positions('O', ['A3', 'B1', 'C1'])
		rules.over?.should == false
		rules.count_empty_spaces.should == 3
	end

	it "#number_of_empty_spaces returns 1 for 1 empty space" do
		set_marker_at_positions('X', ['A2', 'B2', 'B3', 'C3'])
		set_marker_at_positions('O', ['A3', 'B1', 'C1', 'C2'])
		rules.count_empty_spaces.should == 1
	end

	it "#number_of_empty_spaces returns 2 for 2 empty spaces" do
		set_marker_at_positions('X', ['A2', 'B2', 'B3'])
		set_marker_at_positions('O', ['A3', 'B1', 'C1', 'C2'])
		rules.count_empty_spaces.should == 2
	end

	it "#number_of_empty_spaces returns 9 for 9 empty spaces" do
		rules.count_empty_spaces.should == 9
	end

	it "#play_at passes a move to the board" do
		game.play_at('A1', 'X')
	end

	def set_marker_as_winner(marker)
		game.board.spaces['A1'] = marker
		game.board.spaces['A2'] = marker
		game.board.spaces['A3'] = marker
	end

	def set_marker_at_positions(marker, positions)
		positions.each {|pos| game.board.spaces[pos] = marker}
	end

end
