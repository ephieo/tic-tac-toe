require "rspec"
require_relative "../lib/game"

describe Game do 
    # let(:game) {Game.new}
    subject(:game) {described_class.new()}
    it 'says hello' do 
        expect{game.hello}.to output("hello\n").to_stdout
    end

    
end
         