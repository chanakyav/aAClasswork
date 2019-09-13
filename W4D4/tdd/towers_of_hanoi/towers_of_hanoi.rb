require_relative "disk"
require_relative "player"

class TowersOfHanoi 

  attr_reader :tower_1, :tower_2, :tower_3

  def initialize
    @tower_1 = []
    @tower_2 = []
    @tower_3 = []
    fill_tower
  end

  def display
    puts "Tower 1: #{@tower_1}"
    puts "Tower 2: #{@tower_2}"
    puts "Tower 3: #{@tower_3}"
  end

  def move_disk(towers)
  end

  def valid_move?(towers)
    t1, t2 = towers 
    t1.between?(1,3) && t2.between?(1,3)
  end

  private
  def fill_tower
    6.times { |i| @tower_1.unshift(Disk.new(i)) }
  end

end

tower = TowersOfHanoi.new
p tower.tower_1
tower.display

