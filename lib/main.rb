require_relative './game_mode'


game_mode = GameMode.new
game_mode_selection = game_mode.choose_game_mode
game_mode.set_up_game(game_mode_selection)