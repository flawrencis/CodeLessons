#ASCII Chars | 97-122 lowercase | 65 - 90 uppercase

puts "Enter a sentence or word"
string = gets.chomp

puts "Enter the encryption level"
num = gets.chomp
num = num.to_i % 26 #Accounts for numbers above 26 letters in the alphabet
puts "String encrypted. Your shift value is " + num.to_s

output = []

string.each_char do |letter|

	new_letter = letter.ord + num

	if (letter.ord == 32) #Skip letter if it's a space
		letter = ' '
	elsif new_letter > 122 || (new_letter > 90 && new_letter < 97)
		letter = (new_letter - 26).chr #Wrap around ASCII map
	else
		letter = new_letter.chr
	end

	output << letter
end

puts output.join


