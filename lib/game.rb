require_relative 'deck'
require_relative 'player'
require_relative 'hand'

class Game
  attr_reader :deck, :players, :current_player, :current_bet

  def initialize(num_players)
    @deck = Deck.new
    @players = []
    @current_player = 0
    @current_bet = 0
    create_players(num_players)
  end

  def play_round
    deal_cards
    betting_round
    discard_round
    betting_round
    reveal_hands
  end

  private
  def betting_round
    puts "Betting round starts."
    players.each do |player|
      puts "Player #{players.index(player) + 1}, it's your turn to bet."
      puts "Current bet is #{@current_bet}."
      puts "Choose your action: (1) Fold, (2) See, (3) Raise"
      action = gets.chomp.to_i
      case action
      when 1
        player.fold
      when 2
        player.see(@current_bet)
      when 3
        raise_amount = player.raise_bet
        @current_bet += raise_amount
      else
        puts "Invalid action. Player automatically folds."
        player.fold
      end
    end
  end

  def discard_round
    puts "Discard round starts."
    players.each do |player|
      puts "Player #{players.index(player) + 1}, it's your turn to discard."
      player.discard
    end
  end

  def reveal_hands
    puts "Revealing hands..."
    players.each_with_index do |player, index|
        hand_cards = player.hand.cards.map { |card| "#{card.value} of #{card.suit}" }
puts "Player #{index + 1} hand: #{hand_cards.join(', ')}"
      puts "Player #{index + 1} hand strength: #{player.hand.evaluate}"
    end
    winner = players.max_by { |player| player.hand.evaluate }
    puts "Player #{players.index(winner) + 1} wins the pot!"
  end

  def create_players(num)
    num.times { @players << Player.new(Hand.new(deck.deal(5))) }
  end

  def deal_cards
    players.each do |player|
      player.hand = Hand.new(deck.deal(5))
    end
  end

  def player_action(player)
    puts "Player hand: #{player.hand}"
    puts "Current bet is #{@current_bet}."
    puts "Choose your action: (1) Discard, (2) Fold, (3) See, (4) Raise"
    action = gets.chomp.to_i
    case action
    when 1
      player.discard
    when 2
      player.fold
    when 3
      player.see(@current_bet)
    when 4
      raise_amount = player.raise_bet
      @current_bet += raise_amount
    else
      puts "Invalid action."
    end
  end
end

# Main code to run the game
puts "Welcome to Five Card Draw Poker!"
puts "How many players are playing?"
num_players = gets.chomp.to_i
game = Game.new(num_players)
game.play_round