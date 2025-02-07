require 'pry-byebug'
#start with first stock price and calculate profit between all remaining stock prices
#store the days that equal the highest profit and profit number
#move to next stock price and calculate profit between all remaining stock prices
# if the new profit number is bigger than the old then store the days that equal the highest profit and the profit number
#do this until we get to the end of the week
def stock_picker(stockPrices)
  profit = 0
  bestDays = [0, 0]
  copystockPrices = stockPrices.clone
  stockPrices.each_with_index do |buyPrice, index|
    restofArray = copystockPrices.filter! {|element| element != copystockPrices[0]} 
    #binding.pry
    if restofArray.empty?
      p bestDays
      break
    else
      restofArray.each do |sellPrice|
        if profit == 0
          profit = sellPrice - buyPrice
          bestDays[0] = index
          bestDays[1] = stockPrices.find_index(sellPrice)
        elsif sellPrice - buyPrice > profit
          profit = sellPrice - buyPrice
          bestDays[0] = index
          bestDays[1] = stockPrices.find_index(sellPrice)
        end
      end
    end
  end
end

puts stock_picker([1,3,6,9,18,18,6,1,10])
# [1,4]  # for a profit of $15 - $3 == $12
