
def longest_consec(arr, k)
  strings = []
  arr.each_index do |i|
    strings << arr[i...i+k].join('')
  end
  strings.max_by { |str| str.length }
end

p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2)

def luhn(num)
  nums = num.to_s.each_char.map(&:to_i)
  index = (nums.length.even? ? 0 : 1)
  while index < nums.length
    nums[index] *= 2
    index += 2
  end
  nums.each { |n| n -= 9 if n > 9 }
  nums.sum % 10 == 0
end

p luhn('1714')
p luhn('12345')
p luhn('111112')
