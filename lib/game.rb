require_relative './board'
require_relative './input_output'
require_relative './game_strings'
require_relative './game_rules'

class Game

  attr_reader :board

  def initialize(board)
    @board = board
  end


  def start_game(board)
    play_game(board)
  end


  
  private

  # def validate_input(input)
  #   input.to_s.match(/[0-8]/) ? true : false
  # end

  def play_game(board)
    str = GameStrings.new() 
    io = InputOutput.new()
    while board.has_empty_spaces > 0
      board.show_board
      
      io.print(str.take_location_string)
      choice = gets.chomp.to_i
      marker = board.select_play(board.has_empty_spaces) ? 'x' : 'o'
      if board.check_location(choice, board)
        %w[x o].include?(marker) ? board.update_board(marker, validate_input(choice) ? choice : 'Incorrect input, please try again') : (io.print('Choose either x or o markers'))
      else
        io.print(str.spot_taken_string)
      end
    end
    io.print(str.game_over_string) 
  end
end

