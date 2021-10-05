require_relative './board'
require_relative './input_output'
require_relative './game_strings'

class GameRules
  attr_reader :str, :io

  def initialize(input_output,str)
    @str = str
    @io = input_output
  end

  def validate_input(num)
    num < 9 && num > -1 ? true : false
  end

  # num =~ /[0-8]/
  def take_user_input
    io.print(str.take_location_string)
    choice = gets.chomp.to_i
  end
end
