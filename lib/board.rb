class Board
  attr_reader :location, :play_count

  # attr_accessor :location, :marker, :position
  def initialize(location)
    @location = location
    @play_count = 0
  end

  def show_board
    puts " #{location[0]} | #{location[1]} | #{location[2]} \n"\
    " ---------\n #{location[3]} | #{location[4]} | #{location[5]} \n"\
    " ---------\n #{location[6]} | #{location[7]} | #{location[8]} \n"
  end

  def check_wins
    wins = [[0, 1, 2], [2, 5, 8], [6, 7, 8], [0, 3, 6], [1, 4, 7][0, 4, 8], [2, 4, 6], [3, 4, 5]]
  end

  def select_play(spaces)
    spaces % 2 == 0 ? true : false
  end

  def check_location(choice, board)
    board.location[choice] == choice.to_s
  end

  def has_empty_spaces
    result = location.select do |elem|
      elem != 'x' && elem != 'o'
    end

    result.size
  end

  def update_board(marker, position)
    if location[position] == position.to_s
      location[position] = marker
      show_board
    else
      puts 'That position is taken try again'
    end
  end
end
