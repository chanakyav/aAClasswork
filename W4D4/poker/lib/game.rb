require_relative 'deck'
require_relative 'player'

class Game

  attr_reader :players, :current_player
  
  def initialize(*players)
    @deck = Deck.new
    @players = players.map { |p| Player.new(p) }
    @current_player = @players.first
    @pot = 0
  end

  def deal
    #iterate through player list and pop card off deck until each player has 5 cards
    @players.each do |player|
      5.times { player.hand.cards << @deck.cards.pop }
    end
  end

end

if __FILE__ == $0

  game = Game.new('chanakya', 'danna', 'elliot')
  game.deal

  p game.players

end