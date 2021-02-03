# Implement a method stock_picker that takes in an array of stock prices, one for each hypothetical day. 
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(array)
  best_days = Hash.new(0)

  array.each_with_index do |buy_price, idx1|
    buy_day = idx1
    (idx1 + 1...array.length).each do |idx2|
      sell_day = idx2
      sell_price = array[idx2]
      if buy_price <= sell_price
        best_days[[buy_day, sell_day]] = sell_price - buy_price
      end
    end
  end
  result = greatest_value_in_hash(best_days)

  # Days start at 0, wchich is the very first day of the prices
  return "Best day to buy: #{result[0]}\nBest day to sell: #{result[1]}\nProfit: $#{result[2]}"
end

def greatest_value_in_hash(hash)
  sorted_hash = hash.sort_by {|key, value| value}
  last_element = sorted_hash.last
  return last_element.flatten
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
puts stock_picker([1,13,6,9,25,8,6,1,10])