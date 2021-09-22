require_relative './board'
require_relative './input_output'
require_relative './game_strings'

class Game
  def start_game
    board = setup_game
    play_game(board)
  end

  private

  def setup_game
    Board.new(%w[0 1 2 3 4 5 6 7 8])
  end

  def play_game(board)
    str = Game_strings.new() 
    io = Input_output.new()
    board.show_board
    while board.has_empty_spaces > 0
      io.print(str.take_location_string)
      choice = gets.chomp.to_i
      marker = board.select_play(board.has_empty_spaces) ? 'x' : 'o'
      if board.check_location(choice, board)
        %w[x o].include?(marker) ? board.update_board(marker, choice) : (io.print('Choose either x or o markers'))
      else
        io.print(str.spot_taken_string)
      end
    end
    io.print(str.game_over_string) 
  end
end

