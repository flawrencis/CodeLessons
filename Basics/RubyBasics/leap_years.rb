puts "Please enter a starting year!"
startYear = gets.chomp 

puts "Please enter an ending year!"
endYear = gets.chomp

while startYear.to_i <= endYear.to_i
	if startYear.to_f % 400 == 0
		puts startYear
	elsif startYear.to_f % 100 == 0
	elsif startYear.to_f % 4 == 0
		puts startYear
	end

startYear = startYear.to_i + 1		
		
end