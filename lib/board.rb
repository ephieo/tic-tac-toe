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

  def select_play(spaces)
    # if spaces == 9
    #   rand(8).even? ? true : false
    # else
    spaces.even? ? true : false
    # end
  end

  def check_location(choice)
    location[choice - 1] == choice.to_s
  end

  def has_empty_spaces
    result = location.select do |elem|
      elem != 'x' && elem != 'o'
    end

    result.size
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

  # def choose_winner(marker)
  #   play_list = []
  #   play_list.push(marker)
  #   # play_list
  #   play_list[play_list.length() -1]
  # end

  # def choose_winner
  #   # store_winner
  #   # play_list[play_list.length() -1]
  # end
end
