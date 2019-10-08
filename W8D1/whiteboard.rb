def bin_packing(weights, cap) 
    count = 0
    bin = []
    weights.sort!.reverse!
    while !weights.empty?
        bin << weights.shift if bin.empty?
        weights.each_with_index do |e, i|
            if e <= cap - bin.sum
                bin << e
                weights.delete_at(i)
            end
            if bin.sum == cap
                count += 1
                bin = []
                break
            end
        end
    end
    bin.empty? ? count : count+1
end

weights = [4, 8, 1, 4, 2, 1, 3]
cap = 10

p bin_packing(weights, cap)


