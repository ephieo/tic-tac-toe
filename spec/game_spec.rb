require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  # let(:game) {Game.new}
  board = Board.new(%w[0 1 2 3 4 5 6 7 8])
  subject(:game) { described_class.new(board)}
   
  it 'returns an instance of the board class' do
    expect(game.setup_game).to be_a(Board)
  end
end
