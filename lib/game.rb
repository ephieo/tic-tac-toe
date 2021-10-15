# frozen_string_literal: true

require_relative './board'
require_relative './input_output'
require_relative './game_phrases'
require_relative './game_rules'

class Game
  attr_accessor :board, :input_output, :rules, :game_phrases, :player_1, :player_2, :active_player

  def initialize(board, input_output, rules, player_1, player_2)
    @board = board
    @io = input_output
    @rules = rules
    @game_phrases = GamePhrases.new
    @player_1 = player_1
    @player_2 = player_2
    @active_player = player_1
  end

  def start_game(board, io)
    play_game(board, io)
  end

  private

  def play_game(board, io)
    while board.has_empty_spaces.positive? && !board.evaluate_board
      io.show_board
      choice = io.take_user_input

      if rules.validate_input(choice)
        system "clear"
        board.update_board(active_player.marker, choice.to_i, io)
        active_player == player_1 ? set_active_player(player_2) : set_active_player(player_1)

      else
        io.print(game_phrases.incorrect_input_phrase)
      end

    end
    if board.evaluate_board
      io.print("player #{active_player.marker} has won")
    else
      io.show_board
      io.print(game_phrases.game_over_phrase)
    end
  end

  def set_active_player(active_player)
    @active_player = active_player
  end
end
