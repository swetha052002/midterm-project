# player.rb
require_relative 'hand'

require_relative 'hand'

class Player
  attr_accessor :hand, :pot

  def initialize(hand = nil, pot = 0)
    @hand = hand
    @pot = pot
  end

  def discard
    puts "Enter the positions of cards you want to discard (e.g., '1 2 3'): "
    positions = gets.chomp.split.map(&:to_i)
    positions.each { |pos| @hand.cards.delete_at(pos - 1) } # Adjust positions to match array indexing
  end

  def fold
    puts "Player folds."
  end

  def see(current_bet)
    puts "Current bet is #{current_bet}."
  end

  def raise_bet
    puts "Enter the amount to raise: "
    amount = gets.chomp.to_i
    puts "Player raises the bet by #{amount}."
    amount
  end
end

