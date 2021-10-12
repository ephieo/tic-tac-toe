# frozen_string_literal: true

require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_phrases'

describe Game do
  # let(:game) {Game.new}

  locations = %w[0 1 2 3 4 5 6 7 8]
  let(:board) { Board.new(locations) }
  let(:game_phrases) { GamePhrases.new }
  let(:io) { InputOutput.new(board.location, game_phrases) }
  let(:rules) { GameRules.new(io, game_phrases) }
  subject(:game) { described_class.new(board, io, rules) }

  context 'testing that the player can finish the game' do
    it "if the game board is full a 'Game Over' string should be output to the terminal " do
      locations = %w[x o x o x o x o x]
      board = Board.new(locations)

      expect do
        game.start_game(board, InputOutput.new(board.location, game_phrases))
      end.to output(a_string_including("Game Over\n")).to_stdout
    end

    it "returns 'Game Over' string when the baord is full after filling final space on board  " do
      locations = %w[x o x 3 x o x o x]
      board = Board.new(locations)

      allow(rules).to receive(:gets).and_return('3')

      expect do
        game.start_game(board, InputOutput.new(board.location, game_phrases))
      end.to output(a_string_including("Game Over\n")).to_stdout
    end
  end

  it ' If input isn\'t within the range of 0-8 it should return Incorrect string' do
    locations = %w[x o x 3 x o x o x]

    allow(rules).to receive(:gets).and_return('777', '3')

    expect do
      game.start_game(Board.new(locations), InputOutput.new(board.location, game_phrases))
    end.to output(a_string_including("Incorrect input, please enter a string between 0-8\n")).to_stdout
  end
end
