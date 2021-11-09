require_relative './board'
require_relative './input_output'
require_relative './game_phrases'
require_relative './game_rules'
require_relative './computer'

class Game
  attr_accessor :board, :input_output, :rules, :game_phrases, :player1, :player2, :active_player, :winner

  def initialize(board, input_output, rules, game_phrases, player1, player2)
    @board = board
    @io = input_output
    @rules = rules
    @game_phrases = game_phrases
    @player1 = player1
    @player2 = player2
    @active_player = player1
    @winner = nil
  end

  def start_game(board, io)
    play_game(board, io)
  end

  private

  def play_game(board, io)
    io.clear_terminal

    while board.has_empty_spaces.positive? && !board.check_wins?

      io.show_board
      choice = active_player.play_game

      if rules.validate_input(choice)
        io.clear_terminal
        board.update_board(active_player.marker, choice.to_i, io)
        board.check_wins? ? set_winner(active_player.name) : set_winner(nil)
        active_player == player1 ? set_active_player(player2) : set_active_player(player1)

      else
        io.clear_terminal
        io.print(game_phrases.incorrect_input_phrase)
      end

    end
    io.show_board
    if board.check_wins?
      io.announce_winner(winner)
    else
      io.game_over
    end
  end

  private

  def set_active_player(active_player)
    @active_player = active_player
  end

  def set_winner(winner)
    @winner = winner
  end
end
