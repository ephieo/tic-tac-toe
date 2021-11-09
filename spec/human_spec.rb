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
  # let(:game_phrases) { GamePhrases.new }
  # let(:io) { InputOutput.new(board.board_locations, game_phrases) }
  # let(:rules) { GameRules.new(io, game_phrases) }
  let(:game_mode) {GameMode.new(board)}
  subject(:human) { described_class.new('x', 'Human',game_mode.input_output) }

  it 'has a marker' do
    #  allow(game_mode.input_output).to receive(:gets).and_return('3')
    expect(human.marker).to eq('x')
  end

  it ' returns the player\'s choice as an integer' do 
    allow(game_mode.input_output).to receive(:gets).and_return('3')
    active_player = 'x'
    expect(human.play_game).to eq('3')
  end
end
