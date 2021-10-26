# require 'rspec'
# require 'simplecov'
# SimpleCov.start

# require_relative '../lib/game'
# require_relative '../lib/game_mode'
# require_relative '../lib/board'
# require_relative '../lib/input_output'
# require_relative '../lib/game_rules'
# require_relative '../lib/game_phrases'
# require_relative '../lib/player'
# require_relative '../lib/computer'

# describe GameMode do 

#   subject(:game_mode) {described_class.new}
#   before do
#     allow(input_output).to receive(:write)
#   end
#   locations = %w[1 2 3 4 5 6 7 8 9]
#   let(:player_x) { Player.new('x') }
#   let(:player_o) { Player.new('o') }
#   let(:board) { Board.new(locations) }
#   let(:game_phrases) { GamePhrases.new }
#   let(:input_output) { InputOutput.new(board.board_locations, game_phrases) }
#   let(:rules) { GameRules.new(io, game_phrases) }
#   let(:game) {Game.new(board,input_output,rules,player_x,player_o)}


#     context "testing the functionality of choosing game modes" do 
        
#         it "collects the users game mode choice and returns an integer" do 
#             game_selection_number = '0'
#             # allow(input_output).to receive(:gets).and_return('0')
            
            
#             expect(game_mode.set_up_game(game_selection_number)).to be_instance_of(game)
#         end

#     end

  
    
# end 