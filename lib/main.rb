# frozen_string_literal: true

require_relative './game'
require_relative './board'
require_relative './input_output'
require_relative './game_rules'
require_relative './game_strings'

board = Board.new(%w[0 1 2 3 4 5 6 7 8])
game_strings = GameStrings.new
input_output = InputOutput.new(board.location, game_strings)
rules = GameRules.new(input_output,  game_strings)
game = Game.new(board, input_output, rules)
game.start_game(board, input_output)
