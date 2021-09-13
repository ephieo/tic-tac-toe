require "rspec"

require_relative  "../lib/board"

describe Board do 
    subject(:board) {described_class.new()}
    
    it 'draws the game board' do 
        expect{board.show_board}.to output(" 0 | 1 | 2 \n ---------\n 3 | 4 | 5 \n ---------\n 6 | 7 | 8 \n").to_stdout   
    end   
    
    # it 'updates the board with a marker' do 
    #     marker = "x"
    #     position = '0'
    #     board.update_board(marker,position)
    #     update = board.location[position.to_i]
    #     expect(update).to eq("x")
    # end
    it 'checks if the board is full' do 
        expect(board.check_board).to be_truthy
     end
end
