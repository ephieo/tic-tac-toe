# frozen_string_literal: true

class InputOutput
  attr_reader :location, :game_strings

  def initialize(location, game_strings)
    @location = location
    @game_strings = game_strings
  end

  def get_move
    puts game_strings.take_location_string
    gets.chomp.to_i
  end

  def print(string)
    puts string
  end

  def show_board
    puts "\n #{location[0]} | #{location[1]} | #{location[2]} \n"\
    " ---------\n #{location[3]} | #{location[4]} | #{location[5]} \n"\
    " ---------\n #{location[6]} | #{location[7]} | #{location[8]} \n\n"
  end
end
