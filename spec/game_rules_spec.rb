require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/game_rules'

describe GameRules do
  subject(:game_rules) { described_class.new }
  context 'testing that validation functions return the correct values' do
    it 'tests that the input is between the range of 0-8' do
      correct_num = 7
      expect(game_rules.validate_input(correct_num)).to be(7)
    end
    it 'tests that the input is not between the range of 0-8' do
      allow(game_rules).to receive(:gets).and_return('777')
      incorrect_num = 777
      expect do
        game_rules.validate_input(incorrect_num)
      end.to output('Incorrect input, please enter a string between 0-8').to_stdout
      expect(game_rules.validate_input(incorrect_num)).to be(false)
    end

    # it 'returns the users input/choice' do
    #     locations = %w[x o x 3 x o x o x]
    #     allow(game_rules).to receive(:gets).and_return('3')
    #     expect do
    #         game = Game.new(locations)
    #         game.start_game(Board.new(locations))
    #     end.to output(" x | o | x \n ---------\n 3 | x | o \n ---------\n x | o | x \nEnter the number for where you want to play your marker below [0-8]:\nGame Over\n").to_stdout
    #     expect(game_rules.take_user_input).to be(3)
    # end

    # it 'checks that the user number is valid before updating the board' do
    #  correct_num = 7
    #  incorrect_num = 777

    # end
  end
end
