require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/knight'
require_relative 'pieces/king'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/null_piece.rb'

class Board

  attr_reader :rows

  NULL_PIECE = NullPiece.instance
  
  def initialize
    @rows = Array.new(8) { Array.new }
    @rows.each_index do |i|
      if i == 0 || i == 7
        color = (i == 0 ? 'black' : 'white')
        @rows[i] += 
        [Rook.new(color, @rows, [i,0]),
        Knight.new(color, @rows, [i,1]),
        Bishop.new(color, @rows, [i,2]),
        Queen.new(color, @rows, [i,3]),
        King.new(color, @rows, [i,4]),
        Bishop.new(color, @rows, [i,5]),
        Knight.new(color, @rows, [i,6]),
        Rook.new(color, @rows, [i,7])]
      elsif i == 1 || i == 6
        color = (i == 1 ? 'black' : 'white')
        8.times { |n| @rows[i] << Pawn.new(color, @rows, [i, n]) }
      else
        @rows[i] += Array.new(8, NULL_PIECE)
      end
    end
    @sentinel = NULL_PIECE
  end

  def [](pos)
    row, col = pos
    @rows[row][col] 
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos) #color, 
    raise 'invalid move' if self[start_pos] == NULL_PIECE || !valid_pos?(end_pos)
    if self[end_pos] == NULL_PIECE
      current_piece = self[start_pos]
      current_piece.pos = end_pos
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      
    end
    # later implement when trying to take another piece
  end

  def valid_pos?(pos)
    x, y = pos
    x.between?(0,7) && y.between?(0,7)
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

if __FILE__ == $PROGRAM_NAME

  board = Board.new
  # p board.rows[1][0]
  p board.rows[2][0]
  board.move_piece([1,0], [2,0])
  p board.rows[1][0]
  # p board.rows[2][0]
  board.move_piece([1,0], [2,0])
end