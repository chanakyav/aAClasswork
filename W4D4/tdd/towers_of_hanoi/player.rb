class Player 

  def get_move 
    puts "Enter towers to move disk, for example, to move from Tower 1 to Tower 2, input '1,2'"
    guess = gets.chomp
    guess.split(",").map(&:to_i)
  end

  def alert_invalid_guess
    raise "Invalid move, try again"
  end

end