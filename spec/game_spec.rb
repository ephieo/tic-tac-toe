require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_strings'

describe Game do
  # let(:game) {Game.new}
   
  board = Board.new(%w[0 1 2 3 4 5 6 7 8])
  io = InputOutput.new(board.location)
  str = GameStrings.new
  rules = GameRules.new(io,str)
  subject(:game) { described_class.new(board,io,rules)}

  context 'testing that the player can finish the game' do
    it 'tests the game board is full' do
      expect do
        game.start_game(Board.new(%w[x o x o x o x o x]),io)
      end.to output("Game Over\n").to_stdout
    end
    it 'tests that the board has one last free space' do
      locations = %w[x o x 3 x o x o x]
      allow(game).to receive(:gets).and_return('3')

      expect do
        game.start_game(Board.new(locations),io)
      end.to output("Game Over\n").to_stdout
    end
  end

  it 'tests to see if the input it within the range of 0-8' do
    locations = %w[x o x 3 x o x o x]
    allow(game).to receive(:gets).and_return('777')
    allow(game).to receive(:gets).and_return('3')
    expect do
      game.start_game(Board.new(locations),io)
    end.to output("Incorrect input, please try again\n").to_stdout
  end
end
