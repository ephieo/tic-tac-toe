# frozen_string_literal: true

require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/game_rules'
require_relative '../lib/game_phrases'

describe GameRules do
  board = Board.new(%w[1 2 3 4 5 6 7 8 9])
  game_phrases = GamePhrases.new
  io = InputOutput.new(board.location, game_phrases)

  subject(:game_rules) { described_class.new(board, io) }

  context 'input validation functions should return the correct values' do
    it 'input should be between the range of 0-8 and return true' do
      correct_input = '7'

      expect(game_rules.validate_input(correct_input)).to be(true)
    end

    it 'input should not be between the range of 0-8 and should return false' do
      incorrect_input_phrase = '777'

      expect(game_rules.validate_input(incorrect_input_phrase)).to be(false)
    end

    it 'should return false if it\'s given a string instead of a integer' do
      incorrect_input_phrase = 'q'

      expect(game_rules.validate_input(incorrect_input_phrase)).to be(false)
    end
  end

  context 'checking that the marker selection process returns the correct value' do
    it 'checks that choose_marker() returns the correct alternating markers ' do
      size_1 = 3
      size_2 = 9

      expect(game_rules.choose_marker(Board.new(%w[x 1 o 3 4 5 x 7 o]))).to be_an(String)
      expect(game_rules.choose_marker(Board.new(%w[1 2 3 4 5 6 7 8 9]))).to be_an(String)
    end
  end
end
