class Board 
    attr_reader :location
    # attr_accessor :location, :marker, :position
    def initialize ()
        @location = Array ['0','1','2','3','4','5','6','7','8']
        
     end

    def show_board
        puts " #{location[0]} | #{location[1]} | #{location[2]} \n ---------\n #{location[3]} | #{location[4]} | #{location[5]} \n ---------\n #{location[6]} | #{location[7]} | #{location[8]} \n"
    end  
    
    def check_board (choice,board) 
        if board.location[choice] == choice.to_s
            return true
        else
            return false      
        end
    end
        
    def update_board(marker,position)
        if location[position] == position.to_s
            location[position] = marker 
            puts ('this is the location ' + location[position])
            show_board
        else
        puts 'That position is taken try again'
        end
    end
end    