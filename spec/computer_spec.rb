require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/computer'
require_relative '../lib/board'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_phrases'
require_relative '../lib/game_mode'

describe Computer do
  locations = %w[x o 3 x o o o x x]
  let(:board) { Board.new(locations) }
  let(:game_mode) { GameMode.new(board) }
  subject(:computer) { described_class.new('o', 'Computer', board) }

  it 'has a marker' do
    expect(computer.marker).to eq('o')
  end
  it ' returns the computer player\'s choice as an integer' do
    allow(game_mode.input_output).to receive(:gets).and_return('3')

    expect(computer.play_game).to be_a_kind_of(String)
  end
end
