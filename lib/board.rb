class Board 
    attr_reader :location
    def initialize
        @location = {
            '0' => 0,
            '1'=> 1,
            '2'=> 2,
            '3'=> 3,
            '4'=> 4,
            '5'=> 5,
            '6'=> 6,
            '7'=> 7,
            '8'=> 8
        }
     end

    def show_board
        puts " #{location["0"]} | #{location["1"]} | #{location["2"]} \n ---------\n #{location["3"]} | #{location["4"]} | #{location["5"]} \n ---------\n #{location["6"]} | #{location["7"]} | #{location["8"]} \n"
    end    
end    