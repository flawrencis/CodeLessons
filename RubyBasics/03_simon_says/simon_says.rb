def echo(input)
	input
end

def shout(input)
	input.upcase
end

def repeat(input, times=2)
	([input] * times).join(' ')
end

def start_of_word(input, location)
	input[0..location-1]
end

def first_word(input)
	input.split(' ')[0]
end

def titleize(input)
	array = input.split(' ')

	array.each do |i|
		i.capitalize! unless (i == 'and' || i == 'over' || i == 'the')
	end
	array[0].capitalize!
	
	array.join(' ')
end



