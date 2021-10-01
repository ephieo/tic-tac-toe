require_relative './game'
require_relative './board'

board = Board.new(%w[0 1 2 3 4 5 6 7 8])
game = Game.new(board)
game.start_game(board)
 