def substrings (words, dictionary)
	substring = Hash.new(0)
	string = words.downcase.split
	
	string.each do |word|
		dictionary.each do |subword|
			if word.include?(subword)
				puts subword
				substring[subword] += 1
			end
		end 
	end
	puts substring
end

################

word_list = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
word_string = "Howdy partner, sit down! How's it going?"

substrings("word_string", word_list)


# puts "Text please: "
# text = gets.chomp

# words = text.split(" ")
# frequencies = Hash.new(0)
# words.each { |word| frequencies[word] += 1 }
# frequencies = frequencies.sort_by {|a, b| b }
# frequencies.reverse!
# frequencies.each { |word, frequency| puts word + " " + frequency.to_s }