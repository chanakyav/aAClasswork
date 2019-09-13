require_relative 'card'

class Deck

  attr_reader :cards

  SUITS = %w( Spades Clubs Hearts Diamonds ).freeze
  NUMBERS = %w( Ace King Queen Jack 10 9 8 7 6 5 4 3 2 1 ).freeze

  def initialize
    @cards = []
    generate_cards
    @cards.shuffle!
  end

  def generate_cards
    SUITS.each do |suit|
      NUMBERS.each do |num|
        @cards << Card.new(num, suit)
      end
    end
  end
  
end