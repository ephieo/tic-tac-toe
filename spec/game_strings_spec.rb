require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative './../lib/game_strings'

describe GameStrings do
  
  subject(:game_strings) { described_class.new }
  
  it 'returns a string asking the user to enter location number' do
    expect(game_strings.take_location_string).to eq('Enter a number for where you want to play your marker below [0-8]:')
  end

  it 'returns a string letting the user know that their chosen location is taken' do
    expect(game_strings.spot_taken_string).to eq('spot taken try again')
  end

  it 'returns a string letting the user know that the game is over' do
    expect(game_strings.game_over_string).to eq('Game Over')
  end
end
