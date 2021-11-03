require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/computer'

describe Computer do
  subject(:computer) { described_class.new('o','Computer') }

  it 'has a marker' do
    expect(computer.marker).to eq('o')
  end
end
