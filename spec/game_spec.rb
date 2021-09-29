require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  # let(:game) {Game.new}

  subject(:game) { described_class.new(Board.new(%w[0 1 2 3 4 5 6 7 8]))}
  
   
  it 'returns an instance of the board class' do
    expect(game.setup_game).to be_a(Board)
  end
  
  it 'validates if the input is within the correct range' do 
    expect(game.validate_input(input)).to be(true)
  end
  # it 'test that game board is full' do 
  #   allow(game.start_game(Board.new(%w[x o x o x o x o x]))).to receive(:gets).and_return("Game Over\n")
  #   allow(subject).to receive(:loop).and_yield
  #   expect do 
  #     expect(game.start_game(Board.new(%w[x o x o x o x o x])))
  #   end.to output("Game Over\n").to_stdout
  # end
end
