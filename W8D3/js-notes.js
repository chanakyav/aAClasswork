function test_outer() {
    let x = 4;

    // Closure 
    return function test() {
        return ++x;
    }
}

const closure = test_outer();
console.log(closure());
console.log(closure());


// Callback - passing in a function 

global.setTimeout(function() {
    console.log("It has been 3 seconds");
}, 3000);

// or

global.setTimeout(() => {
    console.log("it has been 2 seconds")
}, 2000);