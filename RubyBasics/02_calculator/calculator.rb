def add (a, b)
	a + b
end

def subtract (a, b)
	a - b
end

def sum (array)
	total = 0.0
	array.each do |i|
		total += i
	end
	return total
end

def multiply(*number)
	total = 1.0
	number.each do |i|
		total *= i
	end
	return total
end

def power(a,b)
	a**b
end

def factorial(n)
	total = 1
	n.downto(1) { |i| total = total * i }
	return total
end


