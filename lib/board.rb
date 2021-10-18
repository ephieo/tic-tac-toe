# frozen_string_literal: true

require_relative './input_output'
class Board
  attr_reader :location, :check_wins

  def initialize(location)
    @location = location
    @check_wins = [
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

  # def select_play(spaces)
  #   spaces.even? ? true : false
  # end

  def check_location(choice)
    location[choice - 1] == choice.to_s
  end

  def empty_spaces
    location.select { |elem| elem != 'x' && elem != 'o' }.size
  end

  def update_board(marker, position, io)
    if check_location(position)
      location[position - 1] = marker
    else
      io.spot_taken
    end
  end

  def evaluate_board
    result = check_wins.map { |e| location[e[0]] == location[e[1]] && location[e[0]] == location[e[2]] ? true : false }
    result.find { |e| e == true }
  end
end
