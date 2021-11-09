require 'rspec'
require 'simplecov'
SimpleCov.start

describe Player do
  subject(:player) { described_class.new('x', 'Human') }

  it 'has a marker' do
    expect(player.marker).to eq('x')
  end
end
