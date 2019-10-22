const myFind = function (array, callback) {
    for (let i = 0; i < array.length; i++) {
        if (callback(array[i])) return array[i];
    }
}

function myFind2(array, callback) {
    for (let i = 0; i < array.length; i++) {
        if (callback(array[i])) return array[i];
    }
}

function myFind3(array, callback) {
  for(let el of array) if (callback(el)) return el;
}

const myFind4 = (array, callback) => {for(let el of array) if (callback(el)) return el}

let a = [1,2,3];
let cb = (el) => el > 2;

// console.log(myFind(a, cb));
// console.log(myFind2(a, cb));
console.log(myFind3(a, cb));
console.log(myFind4(a, cb));


