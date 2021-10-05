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

  context 'testing that input validation functions return the correct values' do

    it 'tests that the input is between the range of 0-8' do
      correct_num = 7
      expect(game_rules.validate_input(correct_num)).to be(true)
    end

    it 'tests that the input is not between the range of 0-8' do
      incorrect_num = 777
      expect(game_rules.validate_input(incorrect_num)).to be(false)
    end

  end
   context 'checking that the marker selection process returns the correct value' do 
        it 'checks that choose_marker() returns the correct alternating markers ' do 
            size_1 = 3
            size_2 = 9
            expect(game_rules.choose_marker(Board.new(%w[x 1 o 3 4 5 x 7 o]))).to be(false)
            expect(game_rules.choose_marker(Board.new(%w[0 1 2 3 4 5 6 7 8]))).to be_an(boolean)

        end
   end 
end
