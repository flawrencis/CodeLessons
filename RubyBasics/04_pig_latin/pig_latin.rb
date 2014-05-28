def translate (phrase)
	input_words = phrase.split(' ')
	output_words = []

	alphabet = ('a'..'z').to_a
	vowels = ['a', 'e', 'i', 'o', 'u']
	consonants = alphabet - vowels

	input_words.each do |word|
		# Vowel rules
		if vowels.include?(word[0])
			word = word + 'ay'
			output_words << word
		
		# Special allowances for 'q' and 'qu'
		elsif word[0] == 'q'
			word = word[2..-1] + word[0..1] + 'ay'
			output_words << word
		elsif word.include? 'qu'
			q = word.index('q')
			if consonants.include?(word[q-1])
				word = word[q+2..-1] + word[q-1..q+1] + 'ay'
				output_words << word				
			end

		# Consonant Rules
		elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
			word = word[3..-1] + word[0..2] + 'ay'
			output_words << word
		elsif consonants.include?(word[0]) && consonants.include?(word[1])
			word = word[2..-1] + word[0..1] + 'ay'
			output_words << word	
		elsif consonants.include?(word[0])
			word = word[1..-1] + word[0] + 'ay'
			output_words << word
		end		
	end

	output_words.join(' ')
end

puts ('Please enter a phrase.  I will translate it to Pig Latin')
input = gets.chomp

puts translate(input)