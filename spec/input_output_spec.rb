# frozen_string_literal: true

require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/input_output'
require_relative '../lib/board'
require_relative '../lib/game_strings'

describe InputOutput do
  board = Board.new(%w[0 1 2 3 4 5 6 7 8])
  game_strings = GameStrings.new
  subject(:input_output) { described_class.new(board.location, game_strings) }

  before do
    allow(input_output).to receive(:write)
  end

  it 'gets a move from a player' do
    allow(input_output).to receive(:gets).and_return('3')

    expect do
      input_output.get_move
    end.to output(game_strings.take_location_string).to_stdout
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
end
