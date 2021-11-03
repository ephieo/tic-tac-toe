require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/human'

describe Human do
  subject(:human) { described_class.new('x', 'Human') }

  it 'has a marker' do
    expect(human.marker).to eq('x')
  end
end
