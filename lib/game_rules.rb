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
    result = convert_input_to_int(input)
    result ? input_within_scope?(result) : false
  end

  def validate_game_mode_input(input)
    result = convert_mode_input_to_int(input)
    result ? game_mode_input_within_scope?(result) : false
  end

  private

  def input_within_scope?(input)
    input < 10 && input.positive? ? true : false
  end

  def game_mode_input_within_scope?(input)
    input < 2 || input >= 0 ? true : false
  end

  def convert_input_to_int(input)
    /[^0-9]/ =~ input || input == '' ? false : input.to_i
  end

  def convert_mode_input_to_int(input)
    /[^0-1]/ =~ input || input == '' ? false : input.to_i
  end
end
