require 'rspec'
require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  # let(:game) {Game.new}
  subject(:game) { described_class.new }

  it 'returns an instance of the board class' do
    expect(game.setup_game).to be_a(Board)
  end
end
