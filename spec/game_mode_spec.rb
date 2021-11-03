require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative '../lib/game'
require_relative '../lib/game_mode'
require_relative '../lib/board'
require_relative '../lib/input_output'
require_relative '../lib/game_rules'
require_relative '../lib/game_phrases'
require_relative '../lib/human'
require_relative '../lib/computer'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.allow_message_expectations_on_nil = true
  end
end

describe GameMode do
  let(:player_o) { Human.new('o','Human') }
  let(:player_x) { Human.new('x','Human') }
  let(:computer) { Computer.new('o') }
  let(:board) { Board.new(%w[x o 3 x o o o x x]) }
  let(:game_phrases) { GamePhrases.new }
  let(:input_output) { InputOutput.new(board.board_locations, game_phrases) }
  let(:rules) { GameRules.new(input_output, game_phrases) }
  let(:game) { Game.new(board, input_output, rules, game_phrases, player_x, player_o) }

  subject(:game_mode) { described_class.new(board) }

  context "testing the functionality of choosing game modes" do
    it "creates a game and returns an instance of game with the given parameters" do
      expect(game_mode.create_game(player_o)).to be_instance_of(Game)
    end

    it "creates a human vs human game" do
      allow(game_mode.input_output).to receive(:gets).and_return("3")

      game_mode.set_up_game(0)

      expect(game_mode.game.player1).to be_instance_of(Human)
    end

    it "takes the human as an argument to create a computer vs human game" do
      allow(game_mode.input_output).to receive(:gets).and_return("3")
      allow(game_mode).to receive(:game).and_return(game)

      expect(game_mode).to receive(:create_game).with(an_instance_of(Computer))
      expect(game).to receive(:start_game)

      game_mode.set_up_game(1)
    end

    it "takes the wrong input as an argument and exits the game" do
      expect(game_mode.set_up_game('fyighughtiegh')).to be(nil)
    end

    it "takes input from the user and returns the integer 0" do
      allow(game_mode.input_output).to receive(:gets).and_return("0")

      expect(game_mode.choose_game_mode).to eq("0")
    end

    it "takes input from the user and returns the integer 1" do
      allow(game_mode.input_output).to receive(:gets).and_return("1")

      expect(game_mode.choose_game_mode).to eq("1")
    end
  end
end
