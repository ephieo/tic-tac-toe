require_relative './game'
require_relative './board'
require_relative './input_output'
require_relative './game_rules'
require_relative './game_phrases'
require_relative './player'
require_relative './computer'

class GameMode
  attr_reader :input_output, :board, :game_phrases, :input_output, :rules, :game, :computer

  def initialize(board)
    @board = board
    @game_phrases = GamePhrases.new
    @input_output = InputOutput.new(board.board_locations, game_phrases)
    @rules = GameRules.new(input_output, game_phrases)
    @game = nil
  end

  def set_up_game(game_mode_selection)
    if game_mode_selection == 0
      create_game(Player.new('o'))
    elsif game_mode_selection == 1
      create_game(Computer.new('o'))
    else
      return
    end
    game.start_game(board, input_output)
  end

  def choose_game_mode
    input_output.collect_game_mode_choice
  end

  def create_game(player2)
    set_game(board, input_output, rules, game_phrases, Player.new('x'), player2)
  end

  def set_game(*game)
    @game = Game.new(*game)
  end
end
