# frozen_string_literal: true

require_relative './board'
require_relative './input_output'
require_relative './game_phrases'
require_relative './game_rules'

class Game
  attr_reader :board, :input_output, :rules, :game_phrases

  def initialize(board, input_output, rules)
    @board = board
    @io = input_output
    @rules = rules
    @game_phrases = GamePhrases.new
  end

  def start_game(board, io)
    play_game(board, io)
  end

  private

  def play_game(board, io)
    while board.has_empty_spaces.positive?
      io.show_board
      choice = io.take_user_input

      if rules.validate_input(choice)
        board.update_board(rules.choose_marker(board), choice.to_i, io)
      else
        io.print(game_phrases.incorrect_input_phrase)
      end

    end
    io.show_board
    io.print(game_phrases.game_over_phrase)
  end
end
