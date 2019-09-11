require_relative 'piece'
require_relative 'pieces/null_piece.rb'

class Board
  
  def initialize
    @rows = []
    @sentinel # = sentinel = NullPiece.new
  end

  def [](pos)

  end

  def []=(pos, val)
    
  end

  def move_piece(color, start_pos, end_pos)
    
  end

  def valid_pos?(pos)
    
  end

  def add_piece(piece, pos)
    
  end

  def checkmate?(color)
    
  end

  def find_king(color)
    
  end

  def pieces
    
  end

  def dup
    
  end

  def move_piece!(color, start_pos, end_pos)
    
  end

end