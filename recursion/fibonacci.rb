#These two functions print out the numbers in a fibonacci sequence up to position 'n'
#Both functions are initialized with the same starting variables, and count upwards

#Function using a loop
def fibs(n, num1 = 0, num2 = 1, total = 1)	
	0.upto(n-1) do
		total = num1 + num2
		num1 = num2
		num2 = total
		p num1
	end
end

#Function using recursion
def fibs_rec(n, num1 = 0, num2 = 1, total=1)
	return 0 if n == 0
	p total
	fibs_rec(n-1, num2, num1+num2, num1+num2)
end

#Test code
fibs(15)
fibs_rec(15)