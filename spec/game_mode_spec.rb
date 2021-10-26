require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/game_mode'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_phrases'

describe GameMode do 
    # let(:rules) { GameRules.new(io, game_phrases) }
    # let(:board) { Board.new(%w[1 2 3 4 5 6 7 8 9])}
    # let(:game_phrases) { GamePhrases.new }
    # let(:input_output) { InputOutput.new(board.board_locations, game_phrases) }
    # let(:rules) {GameRules.new(input_output, game_phrases)}
    # let(:game) {Game.new(board,input_output)}
    subject(:game_mode) {described_class.new}

    # it 'Gives the two following choices : 0 for human vs human and 1 for computer vs human' do 
    #     game_phrases = GamePhrases.new
    #     board = Board.new(%w[1 2 3 4 5 6 7 8 9])
    #     input_output = InputOutput.new(board.board_locations, game_phrases)
    #     allow(input_output).to receive(:gets).and_return('1')

    #     expect do
    #       game_mode.choose_game_mode
    #     end.to output(a_string_including("Click 0 to play Human vs Human\n\nClick 1 to play Computer vs Human\n\n")).to_stdout
      
    # end

    # it 'collects the users game mode choice and returns an integer' do 
    #   game_phrases = GamePhrases.new
    #   board = Board.new(%w[x o 3 x o o o x x])
    #   input_output = InputOutput.new(board.board_locations, game_phrases)
    #   allow(input_output).to receive(:gets).and_return('0','3')
    
      
  
    #   expect do
    #     game_mode.set_up_game
    #   end.to output(a_string_including("Click 0 to play Human vs Human\n\nClick 1 to play Computer vs Human\n\n")).to_stdout
    # end
    
end 