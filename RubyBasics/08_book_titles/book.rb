class Book

	def title
		@title
	end

	def title=(bookTitle)

		forbidden_words = ['and', 'the', 'of', 'over', 'in', 'a', 'an']

		newTitle = bookTitle.split.map { |word| 
			if forbidden_words.include?(word)
				word
			else
				word.capitalize
			end
		}
		newTitle[0].capitalize!
		@title = newTitle.join(' ')
	end
end