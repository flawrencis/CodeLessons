var number = 1000;
var total = 0;

for (var i = 1; i < number; i++){
    if (i % 3 == 0 || i % 5 == 0) {
        total += i;
        console.log('Added ' + i);
    }
    
}

console.log('You total is ' + total);