class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length - 1 || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num][num] = true
  end

  def remove(num)
    self[num][num] = false
  end

  def include?(num)
    @store.each do |arr|
      return true if arr[num]
    end
    false
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num][num] = true 
      @count += 1
    end
    if @store.length == count
      resize!
    end
  end

  def remove(num)
    if self.include?(num)
      self[num][num] = false 
      @count -= 1
    end
  end

  def include?(num)
    @store.each do |arr|
      return true if arr[num]
    end
    false
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) {Array.new}
    new_store[0...@store.length] = @store
    @store = new_store
  end
end

# set = ResizingIntSet.new(20)
# set.resize!