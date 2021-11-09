require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/human'
require_relative '../lib/board'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_phrases'
require_relative '../lib/game_mode'

describe Human do
  locations = %w[x o 3 x o o o x x]
  let(:board) { Board.new(locations) }
  let(:game_mode) { GameMode.new(board) }
  subject(:human) { described_class.new('x', 'Human', game_mode.input_output) }

  it 'has a marker' do
    expect(human.marker).to eq('x')
  end

  it ' returns the player\'s choice as an integer' do
    allow(game_mode.input_output).to receive(:gets).and_return('3')

    expect(human.play_game).to eq('3')
  end
end
