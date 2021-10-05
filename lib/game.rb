require_relative './board'
require_relative './input_output'
require_relative './game_strings'
require_relative './game_rules'

class Game
  attr_reader :board, :input_output, :rules, :str

  def initialize(board, input_output,rules)
    @board = board
    @io = input_output
    @rules = rules
    @str = GameStrings.new
  end

  def start_game(board,io)
    play_game(board,io)
  end

  private

  def play_game(board,io)

    while board.has_empty_spaces > 0
     io.show_board

      choice = rules.take_user_input
      marker = board.select_play(board.has_empty_spaces) ? 'x' : 'o'
      if rules.validate_input(choice) && board.check_location(choice)
        board.update_board(marker, choice)
      else
        io.print('Incorrect input, please enter a string between 0-8')
      end
    end
    io.show_board
    io.print(str.game_over_string)
  end
end

