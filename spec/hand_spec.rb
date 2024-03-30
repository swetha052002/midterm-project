# spec/hand_spec.rb
require'hand.rb'

RSpec.describe Hand do
  describe "#initialize" do
    it "creates a new hand with cards" do
      cards = [double('card1'), double('card2')]
      hand = Hand.new(cards)
      expect(hand.cards).to eq(cards)
    end
  end

  # Add more test cases as needed
end
