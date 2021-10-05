require_relative './input_output'
class Board
  attr_reader :location


  def initialize(location)
    @location = location
   
  end


  def check_wins
    wins = [[0, 1, 2], [2, 5, 8], [6, 7, 8], [0, 3, 6], [1, 4, 7][0, 4, 8], [2, 4, 6], [3, 4, 5]]
  end

  def select_play(spaces)
    spaces.even? ? true : false
  end

  def check_location(choice)
   location[choice] == choice.to_s
  end

  def has_empty_spaces
    result = location.select do |elem|
      elem != 'x' && elem != 'o'
    end

    result.size
  end
 #location[position] == position.to_s
  def update_board(marker, position)
    if check_location(position)
      location[position] = marker
    else
      io.print('That position is taken try again')
    end
  end
end
