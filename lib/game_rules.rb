require_relative './board'
require_relative './input_output'
require_relative './game_strings'

class GameRules
  attr_reader :str, :io

  def initialize()
    @str = GameStrings.new
    @io = InputOutput.new
  end

  def validate_input(num)
    num < 8 || num > 0 ? true : false
  end

  # num =~ /[0-8]/
  def take_user_input
    io.print(str.take_location_string)
    choice = gets.chomp.to_i
  end
end
