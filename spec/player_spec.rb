require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('x') }

  it 'has a marker' do
    expect(player.marker).to eq('x')
  end
end
