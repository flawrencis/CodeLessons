puts 'type as many words as you like'

word = 'nil'
array = []

while word != ''
	word = gets.chomp
	array.push word
end
puts ''
puts array.sort