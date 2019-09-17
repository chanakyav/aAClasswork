class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key][key] = true 
      @count += 1
    end
    if @store.length == count
      resize!
    end
  end

  def include?(key)
    # num = key.hash % @store.length
    @store.each do |arr|
      return true if arr[key]
    end
    false
  end

  def remove(key)
    # num = key.hash % @store.length
    if self.include?(key)
      self[key][key] = false 
      @count -= 1
    end
  end

  private

  def [](key)
    @store[key.hash % @store.length]
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
