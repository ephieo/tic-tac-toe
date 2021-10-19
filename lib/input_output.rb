class InputOutput
  attr_reader :board_locations, :game_phrases

  def initialize(board_locations, game_phrases)
    @board_locations = board_locations
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
    puts "\n #{board_locations[0]} | #{board_locations[1]} | #{board_locations[2]} \n"\
    " ---------\n #{board_locations[3]} | #{board_locations[4]} | #{board_locations[5]} \n"\
    " ---------\n #{board_locations[6]} | #{board_locations[7]} | #{board_locations[8]} \n\n"
  end

  def take_user_input
    print(game_phrases.take_location_phrase)
    choice = gets.chomp
  end

  def spot_taken
    print(game_phrases.spot_taken_phrase)
  end

  def announce_winner(marker)
    print(game_phrases.winner_output_phrase(marker))
  end

  def clear_terminal
    system 'clear'
  end
end
