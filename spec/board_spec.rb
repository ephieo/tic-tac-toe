require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new(%w[0 1 2 3 4 5 6 7 8]) }

  it 'draws the game board' do
    expect do
      board.show_board
    end.to output(" 0 | 1 | 2 \n ---------\n 3 | 4 | 5 \n ---------\n 6 | 7 | 8 \n").to_stdout
  end

  it 'updates the board with a marker' do
    marker = 'x'
    position = 0
    board.update_board(marker, position)
    update = board.location[position.to_i]
    expect(update).to eq('x')
  end
  it 'returns true when the postion is available' do
    choice = 3
    expect(board.check_location(choice, board)).to be(true)
  end

  it 'returns false when the position is taken' do
    board = Board.new(%w[0 1 2 x 4 5 6 7 8])
    choice = 3
    expect(board.check_location(choice, board)).to be(false)
  end

  # it 'checks whether the player has won' do
  #   expect(board.check_wins).to be(true)
  # end

  context 'checks for empty spaces on the board' do
    it 'returns true if there are empty spaces on the board' do
      board = Board.new(%w[0 1 2 x 4 5 6 7 8])
      expect(board.has_empty_spaces).to be_truthy
    end
    it 'returns false if there are no empty spaces on the board' do
      board = Board.new(%w[x o x x o x x o o])
      expect(board.has_empty_spaces).to be(0)
    end
  end

  it 'chooses which player plays next' do
   
    expect(board.select_play(0)).to be(true)
    expect(board.select_play(5)).to be(false)
  end
end
