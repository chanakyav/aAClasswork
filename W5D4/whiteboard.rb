def pattern_match(str1, str2) # Max

  hash = {}
  str1_arr = str1.chars
  str2_arr = str2.split

  str1_arr.each_with_index do |char, i|
    if hash.has_key?(char)
      return false if hash[char] != str2_arr[i]
    else
      hash[char] = str2_arr[i]
    end
  end

  true
end


# p pattern_match("abba", "dog cat cat dog")
# p pattern_match("abba", "dog cat cat fish")
# p pattern_match("aaaa", "dog cat cat dog")
# p pattern_match("abba", "dog dog dog dog") # false

def pattern_match(pattern, str) # Chanakya
  hash1 = {}
  hash2 = {}
  str_arr = str.split
  (0...str.length).each do |i|
    hash1[pattern[i]] = i unless hash1.key?(pattern[i])
    hash2[str_arr[i]] = i unless hash2.key?(str_arr[i])
  end
  hash1.values == hash2.values
end

puts 'Problem 1'
p pattern_match("abba", "dog cat cat dog")
p pattern_match("abba", "dog cat cat fish")
p pattern_match("aaaa", "dog cat cat dog")
p pattern_match("abba", "dog dog dog dog") # false
puts


def string_eq?(s, t)
  get_stack(s) == get_stack(t)
end

def get_stack(str)
  stack = []
  str.each_char { |char| char == '#' ? stack.pop : stack.push(char) }
  stack
end

puts 'Problem 2'

p string_eq?('ab#c', 'ad#c')
p string_eq?('ab##', 'c#d#')
p string_eq?('a##c', '#a#c')
p string_eq?('a#c', 'b')
