class Input_output
  def get_move
    puts 'Enter the number for where you want to play your marker below [0-8]:'
    gets.chomp.to_i
  end

  def print(string)
    puts string
  end
end
