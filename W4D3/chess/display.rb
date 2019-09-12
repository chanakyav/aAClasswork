require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    
  end

end

if __FILE__ = $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.render
end