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

  it 'prints out the last played moved by the last human' do
    marker = 'o'
    board_location = 3

    expect do
      input_output.last_played_move(marker, board_location)
    end.to output(a_string_including("Player o just played 'o' at location 3\n")).to_stdout
  end

  it 'lets the human know no one wins and displays finished board' do
    expect do
      input_output.game_over
    end.to output(a_string_including("No one Wins :(\n\nGame Over\n")).to_stdout
  end

  it 'collects the users game mode choice and returns an integer' do
    allow(input_output).to receive(:gets).and_return('1')

    expect do
      input_output.collect_game_mode_choice
    end.to output(a_string_including("Click 0 to play Human vs Human\n\nClick 1 to play Computer vs Human\n\n")).to_stdout
  end
end
