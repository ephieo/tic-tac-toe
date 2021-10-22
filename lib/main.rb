require_relative './game'
require_relative './board'
require_relative './input_output'
require_relative './game_rules'
require_relative './game_phrases'
require_relative './player'
require_relative './computer'
require_relative './game_mode'

board = Board.new(%w[1 2 3 4 5 6 7 8 9])
# player_x = Player.new('x')
# player_o = Player.new('o')
game_phrases = GamePhrases.new
input_output = InputOutput.new(board.board_locations, game_phrases)
rules = GameRules.new(input_output, game_phrases)

game_mode = GameMode.new(rules)
computer = Computer.new 

if game_mode.choose_game_mode == 0
    player_x = Player.new('x')
    player_o = Player.new('o')
elsif game_mode.choose_game_mode == 1
    player_x = Player.new('x')
    player_o = Computer.new('o')
end

game = Game.new(board, input_output, rules, game_phrases, player_x, player_o)
game.start_game(board, input_output)
