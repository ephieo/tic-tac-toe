class InputOutput
   
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_move
    puts 'Enter the number for where you want to play your marker below [0-8]:\n'
    gets.chomp.to_i
  end

  def print(string)
    puts string
  end

  def show_board
    puts "\n #{location[0]} | #{location[1]} | #{location[2]} \n"\
    " ---------\n #{location[3]} | #{location[4]} | #{location[5]} \n"\
    " ---------\n #{location[6]} | #{location[7]} | #{location[8]} \n\n"
  end
end
