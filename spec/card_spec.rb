# spec/card_spec.rb
require 'card.rb'

RSpec.describe Card do
  describe "#initialize" do
    it "creates a new card with suit and value" do
      card = Card.new("Hearts", "Ace")
      expect(card.suit).to eq("Hearts")
      expect(card.value).to eq("Ace")
    end
  end
end
