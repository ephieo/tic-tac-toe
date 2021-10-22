
class GameMode 

    attr_reader :io

    def initialize(input_output)
        @io = input_output
    end

    def choose_game_mode
        io.collect_game_mode_choice
    end

end