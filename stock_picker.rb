# Implement a method #stock_picker that takes an array
# of stock prices, one for each hypothetical day. It should return
# a pair of days representing the best day to buy and the best
# day to sell. Days start at 0.
#

def stock_picker(prices)
  optimal_sell = prices.sort
  optimal_buy = prices.sort{|x,y| y <=> x }

  i = 0
  while i < prices.size
    sell = optimal_sell[i]
    buy = optimal_buy[i]
    if prices.index(sell) < prices.index(buy)
      return [prices.index(sell), prices.index(buy)]
    else
      sell_next = optimal_sell[i + 1]
      buy_next = optimal_buy[i + 1]
      if (buy - sell_next) > (buy_next - sell)
        if prices.index(sell_next) < prices.index(buy)
          return [prices.index(sell_next), prices.index(buy)]
        end
      else
        if prices.index(sell) < prices.index(buy_next)
          return [prices.index(sell), prices.index(buy_next)]
        end
      end
    end
    i += 1
  end
end

print stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]