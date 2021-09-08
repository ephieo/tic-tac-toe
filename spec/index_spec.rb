require "rspec"
require_relative "../lib/index"

describe Game do 
    # let(:game) {Game.new}
    subject(:game) {described_class.new()}
    it 'says hello' do 
        expect{game.hello}.to output("hello\n").to_stdout
    end

    it 'draws a board' do
        expect{game.draw_board}.to output(" 1 | 2 | 3 \n ---------\n 4 | 5 | 6 \n ---------\n 7 | 8 | 9 \n").to_stdout
    end
end
         