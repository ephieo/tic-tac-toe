require_relative './board.rb'


class Game 
    
  def start_game 
    board = Board.new()
    draw_board(board) 
    take_input(board)
    
  end

  
  
  def take_input (board)
    puts 'Enter the number for where you want to play your marker below [0-8]:'
    choice = gets.chomp.to_i
    puts 'Enter your marker below (x or o) :'
    marker = gets.chomp
    puts board.check_board(choice,board)
    if board.check_board(choice,board)
      board.update_board(marker,choice)
    else 
      puts 'spot taken try again'  
    end 

   
  end

    def draw_board (board)
    board.show_board
    end


end  
game = Game.new()
# game.draw_board
game.start_game