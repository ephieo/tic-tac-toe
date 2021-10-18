# frozen_string_literal: true

require_relative './board'
require_relative './input_output'
require_relative './game_phrases'
require_relative './game_rules'

class Game
  attr_accessor :board, :input_output, :rules, :game_phrases, :player1, :player2, :active_player

  def initialize(board, input_output, rules, player1, player2)
    @board = board
    @io = input_output
    @rules = rules
    @game_phrases = GamePhrases.new
    @player1 = player1
    @player2 = player2
    @active_player = player1
  end

  def start_game(board, io)
    play_game(board, io)
  end

  private

  def play_game(board, io)
    while board.empty_spaces.positive? && !board.evaluate_board
      io.show_board
      choice = io.take_user_input

      if rules.validate_input(choice)
        system 'clear'
        active_player == player1 ? set_active_player(player2) : set_active_player(player1)
        board.update_board(active_player.marker, choice.to_i, io)

      else
        io.print(game_phrases.incorrect_input_phrase)
      end

    end
    io.show_board
    if board.evaluate_board
      io.announce_winner(active_player.marker)
    else
      io.print(game_phrases.game_over_phrase)
    end
  end

  def set_active_player(active_player)
    @active_player = active_player
  end
end
