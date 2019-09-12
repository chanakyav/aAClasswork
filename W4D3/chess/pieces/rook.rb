require_relative '../piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def symbol
    
  end

  protected

  def move_dirs
    Slideable.const_get(:HORIZONTAL_DIRS)
  end
end