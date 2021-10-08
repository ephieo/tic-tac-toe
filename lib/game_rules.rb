require_relative './board'
require_relative './input_output'
require_relative './game_strings'

class GameRules
  attr_reader :game_strings, :io

  def initialize(input_output, game_strings)
    @game_strings = game_strings
    @io = input_output
  end

  def validate_input(num)
    num.is_a?(Integer) && num < 9 && num > -1 ? true : false
  end

  def take_user_input
    io.print(game_strings.take_location_string)
    choice = gets.chomp
    /[^0-9]/ =~ choice ? false : choice.to_i
  end

  def choose_marker(board)
    board.select_play(board.has_empty_spaces) ? 'x' : 'o'
  end
end
