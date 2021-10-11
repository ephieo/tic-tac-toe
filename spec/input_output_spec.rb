# frozen_string_literal: true

require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/input_output'
require_relative '../lib/board'
require_relative '../lib/game_phrases'

describe InputOutput do
  board = Board.new(%w[0 1 2 3 4 5 6 7 8])
  game_phrases = GamePhrases.new
  subject(:input_output) { described_class.new(board.location, game_phrases) }

  before do
    allow(input_output).to receive(:write)
  end

  it 'gets a move from a player' do
    allow(input_output).to receive(:gets).and_return('3')

    expect do
      input_output.get_move
    end.to output(game_phrases.take_location_phrase).to_stdout
    expect(input_output.get_move).to eq(3)
  end

  it 'takes a string as an output and prints it out to the terminal' do
    string = 'Hello World !'
    expect do
      input_output.print(string)
    end.to output("Hello World !\n").to_stdout
  end

  it 'draws the game board and displays it to the terminal' do
    expect do
      input_output.show_board
    end.to output("\n 0 | 1 | 2 \n ---------\n 3 | 4 | 5 \n ---------\n 6 | 7 | 8 \n\n").to_stdout
  end
  it 'prints a phrase informing the user that the slected spot is taken' do
    allow(input_output).to receive(:gets).and_return("spot taken try again\n")
    expect do
      input_output.spot_taken
    end.to output("spot taken try again\n").to_stdout
  end
end
