require_relative '../piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol

  end

  protected

  def move_dirs
    Slideable.const_get(:HORIZONTAL_DIRS) + Slideable.const_get(:DIAGONAL_DIRS)
  end
end