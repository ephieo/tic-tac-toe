# frozen_string_literal: true

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
    if spaces == 9
      rand(8).even? ? true : false
    else
      spaces.even? ? true : false
    end
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

  def update_board(marker, position, io)
    if check_location(position)
      location[position] = marker
    else
      puts("That position is taken try again\n\n")
    end
  end
  
end
