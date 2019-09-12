require_relative '../piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  def symbol
    
  end

  protected
  
  def move_diffs
    x, y = pos
    positions = [[x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1],
                 [x + 1, y + 2], [x - 1, y + 2], [x + 1, y - 2], [x - 1, y - 2]]
  end

end