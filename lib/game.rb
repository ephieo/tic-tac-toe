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

  def play_game(board)
    str = GameStrings.new
    io = InputOutput.new
    rules = GameRules.new

    while board.has_empty_spaces > 0
      board.show_board

      choice = rules.take_user_input
      marker = board.select_play(board.has_empty_spaces) ? 'x' : 'o'
      puts "choice ====== #{choice}"
      if rules.validate_input(choice) && board.check_location(choice, board)
        board.update_board(marker, choice)
      else
        io.print('Incorrect input, please enter a string between 0-8')
        puts 'done'
      end

      # if board.check_location(choice, board)
      #   rules.validate_input(choice) ? board.update_board(marker,choice) : return
      # else
      #   rules.validate_input(choice) ?  io.print('Incorrect input, please enter a string between 0-8') : io.print(str.spot_taken_string)
      # end
    end
    io.print(str.game_over_string)
  end
end
