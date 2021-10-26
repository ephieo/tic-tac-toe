require_relative './input_output'
class Board
  attr_reader :board_locations, :winning_combinations

  def initialize(board_locations)
    @board_locations = board_locations
    @winning_combinations = [
      [0, 1, 2],
      [1, 4, 7],
      [6, 7, 8],
      [0, 3, 6],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
      [3, 4, 5]
    ]
  end

  def check_location(choice)
    board_locations[choice - 1] == choice.to_s
  end

  def has_empty_spaces
    board_locations.select { |elem| elem != 'x' && elem != 'o' }.size
  end

  def get_random_play
    free_locations = board_locations.select { |elem| elem != 'x' && elem != 'o' }
    random_space = free_locations[rand(has_empty_spaces)]
    # check_location(random_number) ? get_random_play : random_number.to_s 
  end

  def update_board(marker, position, io)
    if check_location(position)
      board_locations[position - 1] = marker
      io.last_played_move(marker,position)
    else
      io.spot_taken
    end
  end

  def check_wins?
    winning_combinations.any? { |e|
      board_locations[e[0]] == board_locations[e[1]] && board_locations[e[0]] == board_locations[e[2]]
    }
  end
end
