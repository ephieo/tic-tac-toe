class GamePhrases
  def take_location_phrase
    "Enter a number for where you want to play your marker below [0-8]:\n\n"
  end

  def spot_taken_phrase
    "spot taken try again\n"
  end

  def game_over_phrase
    "No one Wins :(\n\nGame Over\n"
  end

  def incorrect_input_phrase
    "Incorrect input, please enter a string between 1-9"
  end

  def winner_output_phrase(marker)
    "Player #{marker} has won"
  end

  def last_played_move_phrase(marker,board_location)
    "Player #{marker} just played '#{marker}' at location #{board_location}\n"
  end

  def game_mode_phrase
    "Click 0 to play Human vs Human\n\nClick 1 to play Computer vs Human\n\n"
  end
end
