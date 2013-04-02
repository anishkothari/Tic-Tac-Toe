require 'board'

class Output

  attr_reader :board

  def intro
    puts "Hello and Welcome to Tic Tac Toe"
    puts "Please enter input using letters A, B, C and numbers 1, 2, 3. For example: B2"
	end

  def player_two_type
    puts "Do you want to play against a human player, easy ai, or hard ai?"
  end

  def play_one_turn
    puts "Where do you want to play?"
  end

  def play_two_turn
    puts "Player two's move."
  end

  def show_board(board)
    puts ""
    puts "\t #{board.spaces['A1']} | #{board.spaces['A2']} | #{board.spaces['A3']} "
    puts "\t -------- "
    puts "\t #{board.spaces['B1']} | #{board.spaces['B2']} | #{board.spaces['B3']} "
    puts "\t -------- "
    puts "\t #{board.spaces['C1']} | #{board.spaces['C2']} | #{board.spaces['C3']} "
    puts ""
  end

  def tell_user_bad_move
    puts "You made an incorrect move. Please enter a new move."
  end

  def tell_player_1_winner
    puts "The game is over! Player 1 won!"
  end

  def tell_player_2_winner
    puts "The game is over! Player 2 won!"
  end

  def tell_draw
    puts "The game has ended in a draw."
  end
end

class SpanishOutput

  attr_reader :board

  def intro
    puts "Hola y Bienvenidos a Tic Tac Toe"
    puts "Por favor escribe entrada en la forma de letras A, B, C y numeros 1, 2, 3. Por ejemplo: B2"
  end

  def player_two_type
    puts "Quieres jugar contra human, easy o hard?"
  end

  def show_board(board)
    puts ""
    puts "\t #{board.spaces['A1']} | #{board.spaces['A2']} | #{board.spaces['A3']} "
    puts "\t -------- "
    puts "\t #{board.spaces['B1']} | #{board.spaces['B2']} | #{board.spaces['B3']} "
    puts "\t -------- "
    puts "\t #{board.spaces['C1']} | #{board.spaces['C2']} | #{board.spaces['C3']} "
    puts ""
  end

  def tell_user_bad_move
    puts "Su entrada es invalido. Por favor escribe una entrada nueva."
  end

  def tell_player_1_winner
    puts "El partido habia acabado! Jugador No. 1 ha ganado!"
  end

  def tell_player_2_winner
    puts "El partido habia acabado! Jugador No. 2 ha ganado!"
  end

  def tell_draw
    puts "The game habia acabado en una empata."
  end
end
