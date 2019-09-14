def windowed_max_range(arr, size)

  current_max_range = nil

  (0..arr.length-size).each do |i|
    sub = arr[i...i+size] 
    min = sub.min
    max = sub.max
    if i == 0 
      current_max_range = max - min
    else 
      current_max_range = max - min if max - min > current_max_range
    end
  end
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2)
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3)  # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4)  # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5)  # 3, 2, 5, 4, 8



