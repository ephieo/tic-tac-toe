require "rspec"
require_relative "../lib/game"
require_relative "../lib/board"

describe Game do 
    # let(:game) {Game.new}
    subject(:game) {described_class.new()}
    it 'shows board' do 
        board = Board.new()
        expect{game.draw_board(board)}.to output(" 0 | 1 | 2 \n ---------\n 3 | 4 | 5 \n ---------\n 6 | 7 | 8 \n").to_stdout
    end
    
    # it 'starts the game' do 
    #     expect(game.start_game).to recieve(pick_player)
    # end  
    
    
end
         