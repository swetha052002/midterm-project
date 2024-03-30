class Card
  attr_reader :suit, :value

  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  VALUES = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end
end