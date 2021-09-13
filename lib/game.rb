require_relative './board.rb'


class Game 
  # def initialize
  #   # playe1  = player
  #   # player 2 = new player
  #   # board = new Board 
  # end

    def hello 
      puts 'hello'
    end 

    def draw_board
    board = Board.new()
    board.show_board
    end
end  
game = Game.new()
game.draw_board