# frozen_string_literal: true

class InputOutput
  attr_reader :location, :game_phrases

  def initialize(location, game_phrases)
    @location = location
    @game_phrases = game_phrases
  end

  def get_move
    puts game_phrases.take_location_phrase
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

  def take_user_input
    print(game_phrases.take_location_phrase)
    choice = gets.chomp
  end

  def spot_taken
    print(game_phrases.spot_taken_phrase)
  end
end
