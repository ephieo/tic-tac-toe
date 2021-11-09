require_relative './player'
require_relative './input_output'

class Human < Player
  
  attr_accessor :marker, :name, :input_output

  def initialize(marker,name,input_output)
    @input_output = input_output
    @marker = marker
    @name = name
  end
   
  def play_game
    input_output.take_user_input(marker)
  end
end
