require_relative './board'

class Game
  def start_game
    board = Board.new(%w[0 1 2 3 4 5 6 7 8])
    board.show_board
    take_input(board)
  end

  def take_input(board)
    while board.check_spaces
        puts 'Enter the number for where you want to play your marker below [0-8]:'
      choice = gets.chomp.to_i
      puts 'Enter your marker below (x or o) :'
      marker = gets.chomp
      if board.check_location(choice, board)
        %w[x o].include?(marker) ? board.update_board(marker, choice) : puts 'Choose either x or o markers'
      else
        puts 'spot taken try again'
      end
    end
    puts 'Game Over'
  end
end
game = Game.new
# game.draw_board
game.start_game
