function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, cur) => acc + cur, 0);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

Function.prototype.curry = function(numArgs) {
  let args = [];
  let that = this;
  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      // return that.apply(this, args);
      return that(...args);
    } else {
      return _curry;
    }
  }
  return _curry;
};

function sum(...numbers) {
  return numbers.reduce((acc, cur) => acc + cur, 0);
}

let f1 = sum.curry(3);
f1(1);
f1(2);
console.log(f1(3));

