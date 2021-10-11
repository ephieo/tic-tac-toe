# frozen_string_literal: true

require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/board'
require_relative '../lib/input_output'

describe Board do
  let(:game_phrases) { GamePhrases.new }
  let(:io) { InputOutput.new(board.location, game_phrases) }
  subject(:board) { described_class.new(%w[0 1 2 3 4 5 6 7 8]) }

  it 'updates the board with a marker' do
    board = Board.new(%w[0 1 2 x 4 5 6 7 8])
    marker = 'x'
    position = 0

    board.update_board(marker, position,io)
    update = board.location[position.to_i]

    expect(update).to eq('x')
  end

  it 'doesn\'t update board and gives error message' do
    board = Board.new(%w[0 1 2 x 4 5 6 7 8])
    marker = 'x'
    position = 3
    allow(board.update_board(marker, position,io)).to receive(:gets).and_return('3')
    expect do
      board.update_board(marker, position,io)
    end.to output("That position is taken try again\n\n").to_stdout
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
