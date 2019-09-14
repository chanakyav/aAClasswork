def my_min(array)

  min = array.first

  array.each do |i|
    array.each do |j|
      min = j if j < min
    end    
  end

  min

end

def my_min2(array)
  array.inject {|acc,el| el < acc ? el : acc}
end

# p my_min2([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def largest_contiguous_subsum(list)
  sum = 0
  result= []

  list.each_with_index do |el1,i|
    sum = el1
    result << el1
    list[i+1..-1].each do |el2|
      sum += el2
      result << sum
    end
  end
  result.max

end

# list = [2, 3, -6, 7, -6, 7]
list = [-5, -1, -3]
p largest_contiguous_subsum(list)


def test(arr)

  i = 0 
  short = []
  j=0
  while j < arr.length 
    j = i+1
    current = arr[i] 
    current_pos = pos_checker(current)
    while j < arr.length && pos_checker(arr[j]) == current_pos 
        current += arr[j]
        j+=1
    end
    short << current
    i = j
  end

  final_list = helper(short)
  # subsums= []

  # i=0 
  # while short[i] < 0
  #   i+=1
  # end
  #   j= i +1 
  #   k= i +2
 
  # while i < short.length && k < short.length&& j < short.length
  #   subsum = short[i]
  #    while k < short.length-1 && j < short.length-1 && short[j] + short[k] >=0
  #       subsum += short[j] + short[k]
  #        j= i +1 
  #        k= i +2 
  #    end
  #    subsums << subsum unless subsum == nil
  #    i+=2
     
  # end
  # subsums
end





def pos_checker(num)
  if num >= 0
    true
  else
    false
  end

end

def helper(arr)

  i=0 

  while arr[i] < 0
    i+=1
  end


  j= arr.length-1
  while arr[j] < 0
    j -= 1
  end

  narr=arr[i..j]
  result = []
  i=0

  while i < narr.length-2
  current = narr[i]
    j = i +2
    while j < narr.length && narr[i+1]+narr[j] >= 0
      current += narr[i+1]+narr[j]
      j +=2
    end
    result << current
    i =j
  end
  return result
end

p helper([-13,5,-2,5,-3,6,-3])