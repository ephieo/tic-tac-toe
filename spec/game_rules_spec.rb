require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/game_rules'


describe GameRules do 
    subject(:game_rules){ described_class.new()}
    it 'tests that the input is between the range of 0-8' do
        num = 777 
        expect(game_rules.validate_input(num)).to be(true)
    end

end