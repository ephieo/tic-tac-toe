class InputOutput
  attr_reader :board_locations, :game_phrases

  def initialize(board_locations, game_phrases)
    @board_locations = board_locations
    @game_phrases = game_phrases
  end

  def print(string)
    puts string
  end

  def show_board
    puts "\n #{board_locations[0]} | #{board_locations[1]} | #{board_locations[2]} \n"\
    " ---------\n #{board_locations[3]} | #{board_locations[4]} | #{board_locations[5]} \n"\
    " ---------\n #{board_locations[6]} | #{board_locations[7]} | #{board_locations[8]} \n\n"
  end

  def take_user_input(marker)
    print(game_phrases.take_location_phrase(marker))
    choice = gets.chomp
  end

  def spot_taken
    print(game_phrases.spot_taken_phrase)
  end

  def announce_winner(marker)
    print(game_phrases.winner_output_phrase(marker))
  end

  def clear_terminal
    system "clear"
  end

  def last_played_move(marker, board_location)
    print(game_phrases.last_played_move_phrase(marker, board_location))
  end

  def collect_game_mode_choice
    print(game_phrases.game_mode_phrase)
    choice = gets.chomp
  end

  def game_over
    clear_terminal
    show_board
    print(game_phrases.game_over_phrase)
  end
end
