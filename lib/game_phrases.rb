# frozen_string_literal: true

class GamePhrases
  def take_location_phrase
    "Enter a number for where you want to play your marker below [0-8]:\n\n"
  end

  def spot_taken_phrase
    "spot taken try again\n"
  end

  def game_over_phrase
    'Game Over'
  end

  def incorrect_input_phrase
    'Incorrect input, please enter a string between 0-8'
  end

  def winner_output_phrase(marker)
    "player #{marker} has won"
  end
end
