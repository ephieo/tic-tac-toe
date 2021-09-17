require 'rspec'
require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  # let(:game) {Game.new}
  subject(:game) { described_class.new }

  # it 'chooses which player plays next' do
  #  expect(game.select_play(spaces)).to be(true)
  #  expect(game.select_play(spaces)).to be(false)
  # end
end
