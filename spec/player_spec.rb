# spec/player_spec.rb
require 'player.rb'

RSpec.describe Player do
  describe "#initialize" do
    it "creates a new player with hand and pot" do
      hand = double('hand')
      player = Player.new(hand, 100)
      expect(player.hand).to eq(hand)
      expect(player.pot).to eq(100)
    end
  end

  # Add more test cases as needed
end
