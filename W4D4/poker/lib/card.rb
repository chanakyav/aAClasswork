class Card

  attr_reader :number, :suit, :face_up
  
  def initialize(number, suit)
    @number = number
    @suit = suit
    @face_up = false 
  end

  def expose
    @face_up = true unless @face_up
  end

  def hide
    @face_up = false if @face_up
  end

  def inspect
    @number + " of " + @suit
  end

end