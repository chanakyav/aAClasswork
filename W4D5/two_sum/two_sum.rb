def bad_two_sum?(arr, target_sum)
  result = []
  (0...arr.length - 1).each do |i|
    (i+1...arr.length).each do |j|
      result << arr[i] + arr[j]
    end
  end
  result.include?(target_sum)
end


arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)

arr.sort!

return false if arr[-1] < target_sum

i = 0
i += 1 until arr[i] > target_sum

result = []
new_arr = arr[0...i]
(0...new_arr.length - 1).each do |i|
    (i+1...new_arr.length).each do |j|
      result << new_arr[i] + new_arr[j]
    end
  end
  result.include?(target_sum)

end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)

  hash = {}
  arr.each_with_index do |i,idx|
    hash[i] = idx
  end
  arr.each_with_index do |j, idx2|
    return true if hash.has_key?(target_sum - j) && hash[target_sum-j] != idx2
  end
  false

end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false