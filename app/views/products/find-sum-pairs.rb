def find_sum_pairs(numbers, int)
  pairs_array = []
  numbers.each do |num1|
    numbers.each do |num2|
      if num1 + num2 == int
        pair = [num1, num2].sort
        pairs_array << pair
      end
    end
  end

 p pairs_array.uniq
end

find_sum_pairs([3,2,4,5,6,7,8,9,10,8,9,5,6,12], 10)