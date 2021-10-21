require_relative './board'
require_relative './input_output'
require_relative './game_phrases'
require_relative './game_rules'

class Game
  attr_accessor :board, :input_output, :rules, :game_phrases, :player1, :player2, :active_player

  def initialize(board, input_output, rules, game_phrases, player1, player2)
    @board = board
    @io = input_output
    @rules = rules
    @game_phrases = game_phrases
    @player1 = player1
    @player2 = player2
    @active_player = player1
  end

  def start_game(board, io)
    play_game(board, io)
  end

  private

  def play_game(board, io)
    io.clear_terminal
    while board.has_empty_spaces.positive? && !board.check_wins?

      io.show_board
      choice = io.take_user_input

      if rules.validate_input(choice)
        io.clear_terminal
        active_player == player1 ? set_active_player(player2) : set_active_player(player1)
        board.update_board(active_player.marker, choice.to_i, io)

      else
        io.clear_terminal
        io.print(game_phrases.incorrect_input_phrase)
      end

    end
    io.show_board
    if board.check_wins?
      io.announce_winner(active_player.marker)
    else
      io.game_over
    end
  end

  def set_active_player(active_player)
    @active_player = active_player
  end
end
