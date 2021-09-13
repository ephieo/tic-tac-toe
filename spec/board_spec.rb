require "rspec"

require_relative  "../lib/board"

describe Board do 
    subject(:board) {described_class.new()}
    
    it 'draws the game board' do 
        expect{board.show_board}.to output(" 0 | 1 | 2 \n ---------\n 3 | 4 | 5 \n ---------\n 6 | 7 | 8 \n").to_stdout   
    end   
    

end
