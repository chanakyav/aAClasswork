class MyStack
  def initialize
    @store = []
    @max = Hash.new(0)
    @sorted = []
  end

  def push(item)
    @store.push(item)
    if @max.empty? ||item == @max.keys.first
      @max[item]+=1
    elsif item > @max.keys.first
      @max =Hash.new(0)
      @max[item]+=1
    end
    nil
  end

  def pop
    item = @store.pop
    if item == @max.keys.first
      if @max[item] > 1
        @max[item] -= 1
      elsif @max[item] == 1
        @max = Hash.new(0)
      end
    end

  end

  def max
    @max.keys.first
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end