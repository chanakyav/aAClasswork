def valid_paren(str) 
    return false if str.length.odd?
    hash = { '(' => ')', '{' => '}', '[' => ']' }
    while !str.empty?
        (0...str.length - 1).each do |i|
             if hash.key?(str[i]) && hash[str[i]] == str[i+1]
                str[i] = ''
                str[i] = ''
                break
             elsif hash.key?(str[i]) && !hash.key?(str[i+1])
                return false
             end
        end
    end
    str.empty?
end

# p valid_paren('()')
# p valid_paren("()[]{}")
# p valid_paren('(]')
# p valid_paren('([)]')
p valid_paren('{[()]}')
