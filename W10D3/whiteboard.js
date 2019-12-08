function removeDups(array) {
    let i = 0;
    while (i < array.length - 1) {
        array[i] === array[i+1] ? array.splice(i, 1) : i++;
    }
    return array;
}

function reverseLetters(str) {
    let letters = [];
    for (let char of str) if (isAlpha(char)) letters.push(char);
    letters.reverse();
    let result = "";
    for (let i = 0; i < str.length; i++) {
        result += isAlpha(str[i]) ? letters.shift() : str[i];
    }
    return result;
}

function isAlpha(char) {
    return char >= 'a' && char <= 'z';
}
console.log(reverseLetters('ab-cd'));

console.log(removeDups([1,1,1,2,3,3,4])) ;

