def my_uniq(arr)
  new_arr = []
  arr.each do |ele|
    new_arr << ele unless new_arr.include?(ele)
  end
  new_arr
end

class Array

  def two_sum
    pairs = []
    
    self.each_index do |i|
      ((i + 1)...self.length).to_a.each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end
end

def my_transpose(arr)
  new_arr = Array.new(arr.length) { Array.new(arr.length) }
  arr.each_with_index do |row, i|
    row.each_with_index do |spot, j|
      new_arr[j][i] = spot
    end
  end
  new_arr
end

def stock_picker(arr)
  pairs = []
  max = 0
    
  arr.each_index do |i|
    ((i + 1)...arr.length).to_a.each do |j|
      if arr[j] - arr[i] > max
        max = arr[j] - arr[i]
        pairs = [i, j]
      end
    end
  end

  pairs
end
