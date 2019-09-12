module Slideable
  
  def horizontal_dirs
    
  end

  def diagonal_dirs
    
  end

  def moves
    move_dirs.map do |dir| 
      x, y = dir
      grow_unblocked_moves_in_dir(x, y)
    end
  end
  
  private

  HORIZONTAL_DIRS = [ [1, 0], [-1, 0], [0, 1], [0, -1] ]
  DIAGONAL_DIRS = [ [1, 1], [1, -1], [-1, 1], [-1, -1] ]

  def move_dirs
    
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    x, y = self.pos
    [dx + x, dy + y]
  end
end