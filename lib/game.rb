# frozen_string_literal: true

require_relative './board'
require_relative './input_output'
require_relative './game_strings'
require_relative './game_rules'

class Game
  attr_reader :board, :input_output, :rules, :str

  def initialize(board, input_output, rules)
    @board = board
    @io = input_output
    @rules = rules
    @str = GameStrings.new
  end

  def start_game(board, io)
    play_game(board, io)
  end

  private

  def play_game(board, io)
    while board.has_empty_spaces.positive?
      io.show_board

      choice = rules.take_user_input
      io.print("prints withing game ==== #{choice}")
      if rules.validate_input(choice)
        board.update_board(rules.choose_marker(board), choice)
      else
        io.print('Incorrect input, please enter a string between 0-8')
      end
    end
    io.show_board
    io.print(str.game_over_string)
  end
end
