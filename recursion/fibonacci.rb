#These two functions print out the numbers in a fibonacci sequence up to position 'n'
#Both functions are initialized with the same starting variables, and count upwards.

#Function using a loop
def fibs(n, num1 = 0, num2 = 1, total = 1)	
	0.upto(n-1) do
		p total
		total = num1 + num2
		num1 = num2
		num2 = total
	end
end

#Function using recursion - it's very similar to the loop function, but drops the need for num2.
#I have added num2 back into the comments to make the logic a bit more readable.
def fibs_rec(n, num1 = 0, total = 1) 			#fibs_rec(n, num1=0, num2=1, total=1)
	return 0 if n == 0
	p total
	fibs_rec(n-1, total, num1+total)			#fibs_rec(n-1, num2, num1+num2, num1+num2)
end

#Test code
fibs(15)
fibs_rec(15)