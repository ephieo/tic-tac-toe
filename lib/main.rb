require_relative './game_mode'
require_relative './board'
require_relative './game_rules'

board = Board.new(%w[1 2 3 4 5 6 7 8 9])
game_mode = GameMode.new(board)
# puts "FIRST INPUT #{game_mode.choose_game_mode.to_s}"
game_mode_selection = game_mode.choose_game_mode
game_mode.rules.validate_game_mode_input(game_mode_selection.to_s) ? game_mode.set_up_game(game_mode_selection.to_i) : exit
