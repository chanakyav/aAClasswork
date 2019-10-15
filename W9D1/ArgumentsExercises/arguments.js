// function sum() {
//   let sum = 0;
//   arguments = Array.from(arguments);
//   arguments.forEach(num => {
//     sum += num;
//   });
//   return sum;
// }

// // const numArr = [1,2,3,4,5];

// console.log(sum(1,2,3,4,5));

function sum(...args) {
  let sum = 0;
  args.forEach(num => {
    sum += num;
  });
  return sum;
}

console.log(sum(1, 2, 3, 4, 5));