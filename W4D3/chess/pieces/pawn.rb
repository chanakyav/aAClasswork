require_relative '../piece'

class Pawn < Piece

  def symbol
    
  end

  def move_dirs
    forward_steps + side_attacks
  end

  private

  def at_start_row?
    x, y = self.pos
    x == 1 || x == 6
  end

  def forward_dir
    
  end

  def forward_steps
    x, y = self.pos
    if self.color == 'black'
      steps = [ [x + 1, y] ]
      if at_start_row? 
        return (steps << [x + 2, y]) 
      else
        return steps
      end
    else
      steps = [ [x - 1, y] ]
      return ( steps << [x - 2, y] if at_start_row? )
    end
  end

  def side_attacks
    x, y = self.pos
    if self.color == 'black'
      return [ [x + 1, y + 1], [x + 1, y - 1] ]
    else
      return [ [x - 1, y + 1], [x - 1, y - 1] ]
    end
  end

end