require_relative './board'
require_relative './input_output'

class Game
  def start_game
    board = Board.new(%w[0 1 2 3 4 5 6 7 8])
    board.show_board
    play_game(board)
  end

  def play_game(board)
    while board.has_empty_spaces > 0
      puts 'Enter the number for where you want to play your marker below [0-8]:'
      choice = gets.chomp.to_i
      marker = board.select_play(board.has_empty_spaces) ? 'x' : 'o'
      if board.check_location(choice, board)
        marker == 'x' || marker == 'o' ? board.update_board(marker, choice) : (puts 'Choose either x or o markers')
      else
        puts 'spot taken try again'
      end
    end
    puts 'Game Over'
  end
end
game = Game.new
game.start_game
