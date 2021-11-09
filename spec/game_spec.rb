require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_mode'
require_relative '../lib/game_phrases'
require_relative '../lib/human'

describe Game do
  locations = %w[1 2 3 4 5 6 7 8 9]
  let(:board) { Board.new(locations) }
  let(:game_phrases) { GamePhrases.new }
  let(:game_mode) { GameMode.new(board) }
  let(:io) { InputOutput.new(board.board_locations, game_phrases) }
  let(:player_x) { Human.new('x', 'Human', game_mode.input_output) }
  let(:player_o) { Human.new('o', 'Human', game_mode.input_output) }
  let(:rules) { GameRules.new(io, game_phrases) }
  subject(:game) { described_class.new(board, game_mode.input_output, rules, game_phrases, player_x, player_o) }

  context 'testing that the human can finish the game' do
    it "if the game board is full a 'Game Over' string should be output to the terminal " do
      locations = %w[x o x x o o o x x]
      board = Board.new(locations)

      expect do
        game.start_game(board, InputOutput.new(board.board_locations, game_phrases))
      end.to output(a_string_including("Game Over\n")).to_stdout
    end

    it "returns 'Game Over' string when the board is full after filling final space on board  " do
      locations = %w[x o x x o o o x x]
      board = Board.new(locations)
      io = InputOutput.new(board.board_locations, game_phrases)
      allow(io).to receive(:gets).and_return('3')

      expect do
        game.start_game(board, io)
      end.to output(a_string_including("Game Over\n")).to_stdout
    end
  end

  it " If input isn't within the range of 1-9 it should return Incorrect string" do
    locations = %w[x o 3 x o o o x x]
    board = Board.new(locations)
    allow(player_o.input_output).to receive(:gets).and_return('777', '3')

    expect do
      game.start_game(board, player_o.input_output)
    end.to output(a_string_including("Incorrect input, please enter a string between 1-9\n")).to_stdout
  end

  it "prints out a string lettin human x know that they've won" do
    locations = %w[x 2 o 4 x 6 7 8 x]
    io = InputOutput.new(board.board_locations, game_phrases)
    allow(io).to receive(:gets).and_return('4')

    expect do
      game.start_game(Board.new(locations), io)
    end.to output(a_string_including("has won\n")).to_stdout
  end
end
