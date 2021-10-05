require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/game_rules'

describe GameRules do
 
board = Board.new(%w[0 1 2 3 4 5 6 7 8])
io = InputOutput.new(board.location)

  subject(:game_rules) { described_class.new(board,io) }

  context 'testing that validation functions return the correct values' do

    it 'tests that the input is between the range of 0-8' do
      correct_num = 7
      expect(game_rules.validate_input(correct_num)).to be(true)
    end

    it 'tests that the input is not between the range of 0-8' do
      incorrect_num = 777
      expect(game_rules.validate_input(incorrect_num)).to be(false)
    end

  end
end
