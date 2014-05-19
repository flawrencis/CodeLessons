//Solution to Project Euler Problem 2
//http://projecteuler.net/problem=2

//By considering the terms in the Fibonacci sequence 
//whose values do not exceed four million, find the sum of the even-valued terms.

var num1 = 0;
var num2 = 1;
var fib = 1;
var total = 0;

while (fib < 4000000) {
    if (fib % 2 === 0){
    	total += fib;
	}
    
	num1 = num2;
	num2 = fib;

	fib = num1 + num2;
}
console.log(total);