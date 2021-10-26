require 'rspec'
require 'simplecov'
SimpleCov.start

require_relative './../lib/game_phrases'

describe GamePhrases do
  subject(:game_phrases) { described_class.new }

  it 'returns a string asking the user to enter location number' do
    marker = 'x'
    string = "Player x enter a number for where you want to play your marker below [1-9]:\n\n"

    expect(game_phrases.take_location_phrase(marker)).to eq(string)
  end

  it 'returns a string letting the user know that their chosen location is taken' do
    expect(game_phrases.spot_taken_phrase).to eq("spot taken try again\n")
  end

  it 'returns a string letting the user know that the game is over' do
    expect(game_phrases.game_over_phrase).to eq("No one Wins :(\n\nGame Over\n")
  end
  it 'returns a string letting the user know they\'ve entered the wrong input' do
    expect(game_phrases.incorrect_input_phrase).to eq("Incorrect input, please enter a string between 1-9")
  end

  it 'returns a string letting the user know what move was just played' do
    marker = 'o'
    board_location = 3

    expect(game_phrases.last_played_move_phrase(marker,board_location)).to eq("Player o just played 'o' at location 3\n")
  end
  it 'returns a string letting the user know who has won the game' do
    marker = 'o'

    expect(game_phrases.winner_output_phrase(marker)).to eq("Player o has won")
  end

  it 'returns a string letting the user choice the game mode' do
   

    expect(game_phrases.game_mode_phrase).to eq("Click 0 to play Human vs Human\n\nClick 1 to play Computer vs Human\n\n")
  end
end
