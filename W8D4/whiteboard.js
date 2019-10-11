function countSmileys(array) {
    let count = 0;
    array.forEach(el => {
        if ( el.endsWith(')') || el.endsWith('D') ) count++;    
    });
    return count;
}

console.log(countSmileys([':)', ';(', ';}', ':-D'])); // should return 2;
console.log(countSmileys([';D', ':-(', ':-)', ';~)']));     // should return 3;
console.log(countSmileys([';]', ':[', ';*', ':$', ';-D'])); // should return 1;

function accum(str) {
    let i = 1;
    let result = '';
    for (let char of str) {
        for (let j = 0; j < i; j++) {
            if (j === 0) result += char.toUpperCase();
            else result += char.toLowerCase();
        }
        i++;
        result += '-';
    }
    return result.substring(0, result.length - 1);
}

console.log(accum("abcd")); //"A-Bb-Ccc-Dddd"
console.log(accum("RqaEzty")); // "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
console.log(accum("cwAt")); // "C-Ww-Aaa-Tttt"