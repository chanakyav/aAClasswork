def first_anagram?(str1, str2)
  arr = str1.split('')
  perms = arr.permutation.to_a

  arr2 = str2.split("")

  perms.include?(arr2)

end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(str1,str2)

  str1.each_char do |char|
    idx = str2.index(char)
    str2[idx] = '' unless idx.nil?
  end

  str2.empty?

end

# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")

def third_anagram?(str1,str2)
  str1.chars.sort! == str2.chars.sort!
end

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

def fourth_anagram?(str1,str2)
  return false if str1.length != str2.length
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  (0...str1.length).each do |i|
    hash1[str1[i]] += 1
    hash2[str2[i]] += 1
  end

  hash1 == hash2

end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")