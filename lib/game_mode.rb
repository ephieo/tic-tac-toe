require_relative './game'
require_relative './board'
require_relative './input_output'
require_relative './game_rules'
require_relative './game_phrases'
require_relative './player'
require_relative './computer'


class GameMode 

    attr_reader :input_output, :board, :game_phrases, :input_output, :rules, :game, :computer

    def initialize
        @board = Board.new(%w[1 2 3 4 5 6 7 8 9])
        @game_phrases = GamePhrases.new
        @input_output = InputOutput.new(board.board_locations, game_phrases)
        @rules = GameRules.new(input_output, game_phrases)
        @game = nil 
    end

 
    def choose_game_mode
        input_output.collect_game_mode_choice
    end
 
    def set_up_game 
        if choose_game_mode == 0
            # puts "You've chosen Player vs Player"
            set_game(board, input_output, rules, game_phrases, Player.new('x'),  Player.new('o'))
        elsif choose_game_mode == 1
            # puts "You've chosen Computer vs Player"
            set_game(board,input_output, rules, game_phrases, Player.new('x'),  Computer.new('o'))
        else
            exit
        end
        game.start_game(board, input_output)
    end

    def set_game(*game)
        # @game = Game.new(game) 
        @game = Game.new(*game)
    end
        

  

end