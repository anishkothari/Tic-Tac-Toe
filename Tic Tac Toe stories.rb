Tic Tac Toe Stories

Story: Markers are placed on the board
In order to play a game of Tic Tac Toe
As the board
I should accept an X or O marker


Scenario: A marker should be placed on an empty board
Given that the board is created
And there are open spaces on the board
Then allow a marker to be placed on the board

Scenario: Human Player Places an X or O on the Board
Given that its the human player's turn
And I am playing as the human player
I want to be able to place an X or O marker on the board


1.5 for the first story

Story: End the game
In order to end a game of Tic Tac Toe
As the board
I should stop the game and not allow new markers to be placed on the board

Scenario 1: A Player has won the game
Given that the board has 3 of the same marker in consecutive horizontal, vertical or diagonal positions
Then don't allow the other player to place a marker on the board

Scenario 2: The game is drawn
Given that there are not 3 of the same marker in consecutive horizontal, vertical or diagonal positions
And there are no empty spaces on the board
Then don't allow a player to place a marker on the board

1.5 for the second story

Play Tic Tac Toe through the command-line
Acceptance criteria:
Play Human v. Human
Input Name
Play a complete game
The game should end when someone wins

7.25 for this story
