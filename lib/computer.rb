require_relative './player'
class Computer < Player
  
  attr_accessor :marker, :name, :board

  def initialize(marker,name,board)
    @board = board
    @marker = marker
    @name = name
  end
   
  def play_game
    board.get_random_play
  end
end
