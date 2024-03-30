# spec/deck_spec.rb
require 'deck.rb'

RSpec.describe Deck do
  describe "#initialize" do
    it "creates a new deck with 52 cards" do
      deck = Deck.new
      expect(deck.cards.size).to eq(52)
    end
  end

  describe "#deal" do
    it "deals specified number of cards from the deck" do
      deck = Deck.new
      cards = deck.deal(5)
      expect(cards.size).to eq(5)
    end
  end
end