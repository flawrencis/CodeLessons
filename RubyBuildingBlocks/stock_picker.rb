def stock_picker(prices)
	buy_day = 0
	sell_day = 0
	profit = []

	while buy_day < prices.size do
		while sell_day < prices.size do
			profit << (prices[sell_day].to_i - prices[buy_day].to_i)
			sell_day += 1
		end
		buy_day += 1
	end

	puts profit
end

###############################

stocks = [17,3,6,9,15,8,6,1,10]
puts stock_picker(stocks)