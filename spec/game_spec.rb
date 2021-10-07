# frozen_string_literal: true

require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_strings'

describe Game do
  # let(:game) {Game.new}

  locations = %w[0 1 2 3 4 5 6 7 8]
  board = Board.new(locations)
  str = GameStrings.new
  io = InputOutput.new(board.location, str)
  rules = GameRules.new(io, str)
  subject(:game) { described_class.new(board, io, rules) }

  context 'testing that the player can finish the game' do
    it "if the game board is full a 'Game Over' string should be output to the terminal " do
      loactations = %w[x o x o x o x o x]
      board = Board.new(locations)
      expect do
        game.start_game(board, InputOutput.new(board.location, GameStrings.new))
      end.to output("Game Over\n").to_stdout
    end
    it "returns 'Game Over' string when the baord is full after filling final space on board  " do
      locations = %w[x o x 3 x o x o x]
      allow(game).to receive(:gets).and_return('3')

      expect do
        game.start_game(Board.new(locations), io)
      end.to output("Game Over\n").to_stdout
    end
  end

  it ' If input isn\'t within the range of 0-8 it should return Incorrect string' do
    locations = %w[x o x 3 x o x o x]
    allow(game).to receive(:gets).and_return('777')
    allow(game).to receive(:gets).and_return('3')
    expect do
      game.start_game(Board.new(locations), io)
    end.to output("Incorrect input, please try again\n").to_stdout
  end
end
