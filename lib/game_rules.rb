require_relative './board'
require_relative './input_output'
require_relative './game_phrases'

class GameRules
  attr_reader :game_phrases, :io

  def initialize(input_output, game_phrases)
    @game_phrases = game_phrases
    @io = input_output
  end

  def validate_input(input)
    convert_input_to_int?(input) ? is_input_numeric?(convert_input_to_int?(input)) : false
  end

  def take_user_input
    io.print(game_phrases.take_location_phrase)
    choice = gets.chomp
  end

  def choose_marker(board)
    board.select_play(board.has_empty_spaces) ? 'x' : 'o'
  end

  private 

  def is_input_numeric?(input)
    input < 9 && input > -1 ? true : false
  end
  def convert_input_to_int?(input)
    /[^0-9]/ =~ input ? false : input.to_i
  end


end
