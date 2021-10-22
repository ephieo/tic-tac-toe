require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/game_mode'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_phrases'

describe GameMode do 
    
    let(:board) { Board.new(%w[1 2 3 x 5 6 7 8 9])}
    let(:game_phrases) { GamePhrases.new }
    let(:io) { InputOutput.new(board.board_locations, game_phrases) }
    subject(:game_mode) {described_class.new(io)}

    it 'Gives the two following choices : 0 for human vs human and 1 for computer vs human' do 
        allow(io).to receive(:gets).and_return('1')
        expect do
            game_mode.choose_game_mode
        end.to output(a_string_including("Click 0 to play Human vs Human\n\nClick 1 to play Computer vs Human\n\n")).to_stdout

    end

    
end 