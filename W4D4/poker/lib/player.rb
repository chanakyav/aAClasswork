require_relative 'hand'

class Player

  attr_accessor :name, :hand, :player_pot
  
  def initialize(name)
    @name = name
    @hand = Hand.new
    @player_pot = 0 # change to buy in amount
  end

  def discard

  end

  def action

  end

  def inspect
    { "name" => @name, "hand" => @hand, "player_pot" => @player_pot }.inspect
  end

end