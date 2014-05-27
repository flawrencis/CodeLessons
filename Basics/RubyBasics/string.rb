puts "HI SONNY, IT'S GRANDMA"
answer = gets.chomp
byeCount = 1
	
while byeCount != 3

	if answer == 'BYE'
		puts "YES, I ALREADY SAID HI, SONNY!"
		byeCount += 1
		answer = gets.chomp					
	end

	if answer != 'BYE'
		byeCount = 1
	end

	if answer != answer.upcase
		puts "SPEAK UP I CAN'T HEAR YOU!"
		answer = gets.chomp
	end

	if answer == answer.upcase && answer != 'BYE'
		year = rand(21) + 1930
		puts "NO, NOT SINCE " + year.to_s
		answer = gets.chomp
	end


end



puts "HI YOURSELF!"

