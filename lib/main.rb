# frozen_string_literal: true

require_relative './game'
require_relative './board'
require_relative './input_output'
require_relative './game_rules'
require_relative './game_phrases'

board = Board.new(%w[1 2 3 4 5 6 7 8 9])
game_phrases = GamePhrases.new
input_output = InputOutput.new(board.location, game_phrases)
rules = GameRules.new(input_output, game_phrases)
game = Game.new(board, input_output, rules)
game.start_game(board, input_output)
