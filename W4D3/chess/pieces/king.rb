require_relative '../piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  def symbol
    
  end

  protected
  
  def move_diffs
    x, y = self.pos
    moves = [ [x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1] ]
    moves += [ [x + 1, y + 1], [x + 1, y - 1], [x - 1, y + 1], [x - 1, y - 1] ]
  end

end