def stock_picker(prices)
	buy_day = 0
	sell_day = 0
	profit = []
	days = []

	while buy_day < prices.size do
		sell_day = buy_day 						#No time travel allowed!

		while sell_day < prices.size do
			revenue = prices[sell_day].to_i - prices[buy_day].to_i
			profit << revenue  					#Store all possible profit values
			days << "#{buy_day}, #{sell_day}" 	#Store all possible day combinations
			sell_day += 1			
		end
		buy_day += 1		
	end

	best_days = days[profit.index(profit.max)] #Find the index of the most profitable day.  It should equal the index of the same day combination.
	roi = profit.max
	puts "The most you can make is $#{roi}. You should do business on days #{best_days}."
end

###############################

stocks = [17,3,6,9,15,8,6,1,10]
puts stock_picker(stocks)


