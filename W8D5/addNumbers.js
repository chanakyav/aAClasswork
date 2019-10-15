const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {

  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
    return;
  }
  
  reader.question("Input number: ", (answer) => {
    let num = parseInt(answer);
    sum += num;
    console.log(sum);
    
    addNumbers(sum, --numsLeft, completionCallback);
  });

}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));







