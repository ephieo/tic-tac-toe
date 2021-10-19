require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/input_output'
require_relative '../lib/board'
require_relative '../lib/game_phrases'

describe InputOutput do
  board = Board.new(%w[1 2 3 4 5 6 7 8 9])
  game_phrases = GamePhrases.new

  subject(:input_output) { described_class.new(board.board_locations, game_phrases) }

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
    end.to output("\n 1 | 2 | 3 \n ---------\n 4 | 5 | 6 \n ---------\n 7 | 8 | 9 \n\n").to_stdout
  end

  it 'prints a phrase informing the user that the slected spot is taken' do
    allow(input_output).to receive(:gets).and_return("spot taken try again\n")

    expect do
      input_output.spot_taken
    end.to output("spot taken try again\n").to_stdout
  end
  it 'prints out string that lets the players know who has won the game' do
    marker = 'x'
    allow(input_output).to receive(:gets).and_return("Player #{marker} has won")

    expect do
      input_output.announce_winner(marker)
    end.to output(a_string_including("Player x has won\n")).to_stdout
  end

  it 'should clear the terminal when run' do 
    allow(input_output).to receive(:gets).and_return("2")

    expect do
      input_output.clear_terminal
    end.to output("").to_stdout
  end 
end
