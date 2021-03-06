require 'rspec'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.allow_message_expectations_on_nil = true
  end
end

require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_phrases'

describe Board do
  let(:game_phrases) { GamePhrases.new }
  let(:io) { InputOutput.new(board.board_locations, game_phrases) }
  subject(:board) { described_class.new(%w[1 2 3 4 5 6 7 8 9]) }

  it 'updates the board with a marker' do
    board = Board.new(%w[1 2 3 x 5 6 7 8 9])
    marker = 'x'
    position = 1

    board.update_board(marker, position, io)
    update = board.board_locations[position.to_i - 1]

    expect(update).to eq('x')
  end

  it 'doesn\'t update board and gives error message' do
    marker = 'x'
    position = 3

    board = Board.new(%w[0 1 2 x 4 5 6 7 8])

    allow(board.update_board(marker, position, io)).to receive(:gets).and_return('3')

    expect do
      board.update_board(marker, position, io)
    end.to output("spot taken try again\n").to_stdout
  end

  it 'returns true when the postion is available' do
    choice = 3

    expect(board.check_location(choice)).to be(true)
  end

  it 'returns false when the position is taken' do
    board = Board.new(%w[0 1 2 x 4 5 6 7 8])
    choice = 3

    expect(board.check_location(choice)).to be(false)
  end

  context 'checks for empty spaces on the board' do
    it 'returns true if there are empty spaces on the board' do
      board = Board.new(%w[1 2 3 x 5 6 7 8 9])

      expect(board.has_empty_spaces).to be_truthy
    end
    it 'returns false if there are no empty spaces on the board' do
      board = Board.new(%w[x o x x o x x o o])

      expect(board.has_empty_spaces).to be(0)
    end
  end

  it 'returns true if human X has won' do
    board = Board.new(%w[x x x 4 5 6 7 8 9])

    expect(board.check_wins?).to be(true)
  end
  it 'returns nil if no human has won yet' do
    board = Board.new(%w[1 2 3 x 5 6 7 8 9])

    expect(board.check_wins?).to eq(false)
  end

  it 'checks the board and returns a random number to play' do
    board = Board.new(%w[1 2 3 x 5 6 7 8 9])
    marker = 'o'

    board.update_board(marker, board.get_random_play.to_i, io)

    expect(board.has_empty_spaces).to be(7)
  end
end
