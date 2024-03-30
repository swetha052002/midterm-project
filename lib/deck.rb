class Deck
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(num_cards)
    @cards.pop(num_cards)
  end

  private

  def create_deck
    deck = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end
end