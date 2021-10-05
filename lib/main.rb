require_relative './game'
require_relative './board'
require_relative './input_output'
require_relative './game_rules'
require_relative './game_strings'

board = Board.new(%w[0 1 2 3 4 5 6 7 8])
str = GameStrings.new
input_output = InputOutput.new(board.location)
rules = GameRules.new(input_output,str)
game = Game.new(board,input_output,rules)
game.start_game(board,input_output)
