class Hand
  attr_reader :cards

  HAND_RANKINGS = {
    high_card: 0,
    one_pair: 1,
    two_pairs: 2,
    three_of_a_kind: 3,
    straight: 4,
    flush: 5,
    full_house: 6,
    four_of_a_kind: 7,
    straight_flush: 8
  }

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    if straight_flush?
      :straight_flush
    elsif four_of_a_kind?
      :four_of_a_kind
    elsif full_house?
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif three_of_a_kind?
      :three_of_a_kind
    elsif two_pairs?
      :two_pairs
    elsif one_pair?
      :one_pair
    else
      :high_card
    end
  end

  def compare(other_hand)
    my_rank = HAND_RANKINGS[evaluate]
    other_rank = HAND_RANKINGS[other_hand.evaluate]

    if my_rank > other_rank
      1
    elsif my_rank < other_rank
      -1
    else
      0
    end
  end

  private

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    same_value_cards_count(4)
  end

  def full_house?
    same_value_cards_count(3) && same_value_cards_count(2)
  end

  def flush?
    suits = @cards.map(&:suit)
    suits.uniq.size == 1
  end

  def straight?
    values = @cards.map { |card| Card::VALUES.index(card.value) }.sort
    (values.last - values.first) == 4 && values.uniq.size == 5
  end

  def three_of_a_kind?
    same_value_cards_count(3)
  end

  def two_pairs?
    values_count = Hash.new(0)
    @cards.each { |card| values_count[card.value] += 1 }
    values_count.values.count(2) == 2
  end

  def one_pair?
    same_value_cards_count(2)
  end

  def same_value_cards_count(count)
    values_count = Hash.new(0)
    @cards.each { |card| values_count[card.value] += 1 }
    values_count.values.include?(count)
  end
end
