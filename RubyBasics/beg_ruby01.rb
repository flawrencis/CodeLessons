lines = File.readlines("text.txt")  #read text file into var
text = lines.join

stopwords = %w{the a by on for of are with just but and to the my I has some in}
keywords = text.split.select { |word| !stopwords.include?(word) }


total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

word_count = text.split.length
line_count = lines.size
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters with no spaces"
puts "#{word_count} words"
puts "#{keywords.length} important words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph"
puts "#{word_count / sentence_count} words per sentence"

